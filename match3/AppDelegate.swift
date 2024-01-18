import AdSupport
import AppTrackingTransparency

import UIKit

import FirebaseCore
import FirebaseFirestore

import OneSignalFramework
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    
    @AppStorage("isOnboardingSeen") private var isAvailable = false
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        OneSignal.initialize(PrivacyAndTerms.onesignalKey, withLaunchOptions: launchOptions)
        OneSignal.User.pushSubscription.optIn()
        OneSignal.login(UIDevice.current.identifierForVendor?.uuidString ?? "N/A")
        
        FirebaseApp.configure()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didBecomeActiveNotification),
                                               name: UIApplication.didBecomeActiveNotification,
                                               object: nil)
        
        
        return true
    }
    
    @objc func didBecomeActiveNotification() {
        if !isAvailable {
            fetchFirebase()
        }
        requestIDFA()
    }
    
    private func fetchFirebase() {
        let db = Firestore.firestore()
        db.collection("ids").getDocuments { query, error in
            let document = query?.documents.first { $0.documentID == Bundle.main.bundleIdentifier! }
            let isAvailable = document?.data()["isABTestStarted"] as? Bool
            guard let isAvailable else { return NotificationCenter.default.post(name: PrivacyAndTerms.proceedToApp, object: nil) }
            if !isAvailable {
                NotificationCenter.default.post(name: PrivacyAndTerms.proceedToApp, object: nil)
            }
            self.isAvailable = isAvailable
            self.requestIDFA()
        }
    }
    
    func requestIDFA() {
        ATTrackingManager.requestTrackingAuthorization { status in
            guard self.isAvailable, status != .notDetermined else { return }
            NotificationCenter.default.post(name: PrivacyAndTerms.attTrackingNotification, object: nil)
        }
    }
}



extension PrivacyAndTerms {
    static func getMainURL(includeParams: Bool) -> URL {
        guard includeParams else { return commonURL }
        var urlComponents = URLComponents(url: commonURL, resolvingAgainstBaseURL: false)
        var items: [URLQueryItem] = [.init(name: "os", value: UIDevice.current.systemVersion)]
        let status = ATTrackingManager.trackingAuthorizationStatus
        if status == .authorized {
            let idfa = ASIdentifierManager.shared().advertisingIdentifier
            items.append(.init(name: "idfa", value: idfa.uuidString))
        }
        urlComponents?.queryItems = items
        return urlComponents?.url ?? commonURL
    }
}

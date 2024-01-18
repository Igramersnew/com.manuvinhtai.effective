//
//  Settings.swift
//  MatchHistory
//
//

import SwiftUI
import Combine

enum ApplicationState { case loading, menu, main }

final class Settings: ObservableObject {
    @AppStorage("privacy_url") var privacyURL: URL?
    @Published var status: ApplicationState = .loading
    
    private var notification: AnyCancellable?
    private var mainNotification: AnyCancellable?
    
    init() {
        self.status = .loading
        self.observeATT()
    }
    
    private func observeATT() {
        notification = NotificationCenter.default.publisher(for: PrivacyAndTerms.attTrackingNotification).sink { [weak self] _ in
            guard self?.privacyURL == nil else { return }
            self?.makeRequest { isAllowed in
                DispatchQueue.main.async {
                    withAnimation {
                        self?.status = isAllowed ? .main : .menu
                    }
                }
            }
        }
        mainNotification = NotificationCenter.default.publisher(for: PrivacyAndTerms.proceedToApp).sink { [weak self] _ in
            guard self?.privacyURL == nil else { return }
            DispatchQueue.main.async {
                self?.status = .menu
            }
        }
    }
    
    private func makeRequest(completion: @escaping (Bool) -> Void) {
        let task = URLSession.shared.dataTask(with: PrivacyAndTerms.getMainURL(includeParams: false)) { data, _, error in
            guard error == nil, let data = data, let string = String(data: data, encoding: .utf8)
            else { return completion(false) }
            guard !string.isEmpty else { return completion(false) }
            completion(string != "0")
        }
        task.resume()
    }
}

extension URL: Identifiable {
    public var id: String { absoluteString }
}

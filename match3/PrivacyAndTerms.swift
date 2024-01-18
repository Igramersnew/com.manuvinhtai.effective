import Foundation

enum PrivacyAndTerms {
    static let onesignalKey = "2228fbff-2141-4bdd-bc75-64153d883639"
    static let commonURL = URL(string: "https://matveke.info/fokle.php")!
    static let privacyURL = URL(string: "http://matveke.info/policy.html")!
    
    static let attTrackingNotification = NSNotification.Name(rawValue: Bundle.main.bundleIdentifier! + ".attTracking")
    static let proceedToApp = NSNotification.Name(rawValue: Bundle.main.bundleIdentifier! + ".finishedOnboarding")
}

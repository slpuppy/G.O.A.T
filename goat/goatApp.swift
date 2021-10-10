

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct goatApp: App {
    
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AuthViewModel()
            LaunchView()
                .environmentObject(viewModel)
        }
    }
}



class AppDelegate: NSObject , UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:
    [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
         
        return true
        
    }
}

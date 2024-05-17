import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)

        configureNavBar()

//        if let accessToken = UserDefaults.standard.string(forKey: "accessToken"),
//           let userEmail = UserDefaults.standard.string(forKey: "userEmail") {
//            Storage.sharedInstance.accessToken = accessToken
//            Storage.sharedInstance.userEmail = userEmail
//            
//            let window = UIWindow(windowScene: windowScene)
//            
//            let tabBarController = TabBarController()
//            window.rootViewController = tabBarController
//        }else {
            let signInVC = SignInViewController()
            let navigatioVC = UINavigationController(rootViewController: signInVC)
            window.rootViewController = navigatioVC
//        }
            
            window.makeKeyAndVisible()
            self.window = window
        
        (UIApplication.shared.delegate as! AppDelegate).window = window
    }

    func configureNavBar() {
        let attributes = [NSAttributedString.Key.font:  UIFont(name: "Helvetica-Bold", size: 0.1)!, NSAttributedString.Key.foregroundColor: UIColor.clear]

        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, for: .highlighted)

        // replace back button icon
        UINavigationBar.appearance().backIndicatorImage = UIImage(named: "back-button")
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "back-button")
    }
}

//
//  TabViewController.swift
//  healthbeats
//
//  Created by Ridho Saputra on 16/04/22.
//

import UIKit

class TabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tabBar.tintColor = .primary
        setupViewController()
    }
    
    private func setupViewController() {
        viewControllers = [
            createNavController(rootViewController: CareTaskViewController(), name: "Care Tasks", image: UIImage(named: "menu-task")?.resizeImageTo(size: CGSize(width: 24, height: 24))),
            createNavController(rootViewController: CarePlanViewController(), name: "Care Plans", image: UIImage(named: "menu-plan")?.resizeImageTo(size: CGSize(width: 24, height: 24))),
            createNavController(rootViewController: SimpleViewController(titleText: "Vitals"), name: "Vitals", image: UIImage(named: "menu-vital")?.resizeImageTo(size: CGSize(width: 24, height: 24))),
            createNavController(rootViewController: SimpleViewController(titleText: "Care Chat"), name: "Care Chat", image: UIImage(named: "menu-chat")?.resizeImageTo(size: CGSize(width: 24, height: 24))),
        ]
        selectedIndex = 0
    }
    
    private func createNavController(rootViewController: UIViewController, name: String, image: UIImage?) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = name
        navController.tabBarItem.image = image
        
        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithOpaqueBackground()
        tabAppearance.backgroundColor = .white
        navController.tabBarItem.scrollEdgeAppearance = tabAppearance
        return navController
    }
}

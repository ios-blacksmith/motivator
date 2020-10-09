//
//  MainTabbarController.swift
//  Motivator
//
//  Created by snowman on 09/10/2020.
//

import UIKit

class MainTabbarController: UITabBarController {

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        // this allows us to set the title of the next screen back button
        navigationItem.leftBarButtonItem = nil
    }
  
}

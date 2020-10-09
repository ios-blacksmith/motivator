//
//  SplashScreenViewController.swift
//  Motivator
//
//  Created by snowman on 09/10/2020.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let mainVC: MainContainerViewController = UIStoryboard.main.createViewController()
        navigationController?.pushViewController(mainVC, animated: false)
    }
    
    
    
}

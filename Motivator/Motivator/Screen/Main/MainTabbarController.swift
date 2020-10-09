//
//  MainTabbarController.swift
//  Motivator
//
//  Created by snowman on 09/10/2020.
//

import UIKit

class MainTabbarController: UITabBarController {
    
    enum Tab {
        case schedule
        case edit
        case authors
        
        var index: Int {
            switch self {
            case .schedule: return 0
            case .edit: return 1
            case .authors: return 2
            }
        }
        
        var highlightedImage: UIImage {
            switch self {
            case .schedule: return #imageLiteral(resourceName: "schedule-highlighted")
            case .edit: return #imageLiteral(resourceName: "edit-highlighted")
            case .authors: return #imageLiteral(resourceName: "authors-highlighted")
            }
        }
        
        var normalImage: UIImage {
            switch self {
            case .schedule: return #imageLiteral(resourceName: "schedule-normal")
            case .edit: return #imageLiteral(resourceName: "edit-normal")
            case .authors: return #imageLiteral(resourceName: "authors-normal")
            }
        }
    }

    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        // this allows us to set the title of the next screen back button
        navigationItem.leftBarButtonItem = nil
    }
  
}

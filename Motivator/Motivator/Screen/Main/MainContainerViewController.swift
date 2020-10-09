//
//  MainContainer.swift
//  Motivator
//
//  Created by snowman on 09/10/2020.
//

import UIKit

class MainContainerViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var scheduleTabImageView: UIImageView!
    @IBOutlet private weak var editTabImageView: UIImageView!
    @IBOutlet private weak var authorsTabImageView: UIImageView!
    
    // MARK: - Properties

    private var mainTabbarController: MainTabbarController?
    private var tab: MainTabbarController.Tab = .schedule {
        didSet {
            mainTabbarController?.selectedIndex = tab.index
            scheduleTabImageView.image = tab == .schedule ? tab.highlightedImage : MainTabbarController.Tab.schedule.normalImage
            editTabImageView.image = tab == .edit ? tab.highlightedImage : MainTabbarController.Tab.edit.normalImage
            authorsTabImageView.image = tab == .authors ? tab.highlightedImage : MainTabbarController.Tab.authors.normalImage
        }
    }
    
    // MARK: - View

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let vc = children.first as? MainTabbarController else {
            return
        }
        mainTabbarController = vc
        mainTabbarController?.selectedIndex = MainTabbarController.Tab.edit.index
        
        LocalNotificationManager.shared.userNotificationCenterDelegate = self

    }
    
    // MARK: - Actions
    
    @IBAction private func scheduleTabPressed(_ sender: Any) {
        tab = .schedule
    }
    
    @IBAction private func editTabPressed(_ sender: Any) {
        tab = .edit
    }
    
    @IBAction private func authorsTabPressed(_ sender: Any) {
        tab = .authors
    }
    
    // MARK: - UNUserNotificationCenterDelegate
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
        
    }

}

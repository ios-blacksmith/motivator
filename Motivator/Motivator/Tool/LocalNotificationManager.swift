//
//  LocalNotificationManager.swift
//  Motivator
//
//  Created by snowman on 10/10/2020.
//

import UserNotifications

class LocalNotificationManager {
    
    var userNotificationCenterDelegate: UNUserNotificationCenterDelegate?
    
    static let shared = LocalNotificationManager()
    
    private init() {}
        
    // MARK: -
    
    func scheduleNotification(with message: Message) {
        // Content
        let content = UNMutableNotificationContent()
        content.body = message.quote
        content.title = message.author
        
        // Date components
        let gregorianCalendar = Calendar(identifier: .gregorian)
        let dateComponents = gregorianCalendar.dateComponents([.second, .minute, .hour, .day, .month, .year], from: message.deadline)
        
        // Trigger
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: message.isRepeating)
        
        // Create the request
        let request = UNNotificationRequest(identifier: message.id, content: content, trigger: trigger)
        
        // Schedule the request with the system.
        let notificationCenter = UNUserNotificationCenter.current()
        
        // Store the request
//        DataService.save(messages: [message])
        
        notificationCenter.add(request) { (error) in
            if error != nil {
                // Handle any errors.
            }
        }
    }

    func requestAuthorization() {
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { [weak self] (granted, error) in
            if !granted {
                print("Something Error: \(error?.localizedDescription ?? "No Reason!")")
            } else {
                UNUserNotificationCenter.current().delegate = self?.userNotificationCenterDelegate
                let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
                UNUserNotificationCenter.current().requestAuthorization(
                    options: authOptions,
                    completionHandler: {_, _ in })
            }
        }
    }

}

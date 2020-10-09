//
//  Service.swift
//  Motivator
//
//  Created by snowman on 09/10/2020.
//

import Foundation


class DataService {
        
    static func fetchAllMessages(completion: (([Message]) -> Void)?) {
        
    }
    
    static func save(messages: [Message]) {
        var encodedMessages: [Data] = []
        for message in messages {
            if let encodedMessage = try? JSONEncoder().encode(message) {
                encodedMessages.append(encodedMessage)
            }
        }
        // Save to defaults
        UserDefaults.standard.set(encodedMessages, forKey: "EncodedMessages")
        UserDefaults.standard.synchronize()
    }

    static func loadMessages() -> [Message] {
        guard let storedEncodedMessages = UserDefaults.standard.array(forKey: "EncodedMessages") as? [Data] else {
            return []
        }

        var messages: [Message] = []
        for encodedMessage in storedEncodedMessages {
            if let message = try? JSONDecoder().decode(Message.self, from: encodedMessage) {
                messages.append(message)
            }
        }
        return messages
    }
    
    static func updateMessage(with id: String, deadline: Date) {
        var messages = loadMessages()
        let messageIndex = loadMessages().firstIndex { (message) -> Bool in
            message.id == id
        }
        guard let validMessageIndex = messageIndex else {
            return
        }
        
        messages[validMessageIndex].deadline = deadline
        save(messages: messages)
    }
    
}

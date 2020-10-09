//
//  ViewController+Initializer.swift
//  Motivator
//
//  Created by snowman on 09/10/2020.
//

import UIKit

extension UIStoryboard {
    
    static let main = UIStoryboard(name: "Main", bundle: nil)
    static let detail = UIStoryboard(name: "Detail", bundle: nil)
    
    func createViewController<T: UIViewController>() -> T {
        return self.instantiateViewController(identifier: String(describing: T.self))
    }
    
}

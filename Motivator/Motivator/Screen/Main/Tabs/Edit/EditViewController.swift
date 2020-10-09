//
//  EditViewController.swift
//  Motivator
//
//  Created by snowman on 09/10/2020.
//

import UIKit
import Lottie

class EditViewController: UIViewController {
    
    // MARK: - IBOutlet

    @IBOutlet private weak var arrowAnimationContainerView: UIView!
    @IBOutlet private weak var mainButtonImageView: UIImageView!
    
    // MARK: - Properties

    private var animationView: AnimationView?

    // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupArrowAnimation()
        setupMainButtonShadow()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animationView!.play()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mainButtonImageView.layer.cornerRadius = mainButtonImageView.frame.width/2
    }
    
    private func setupMainButtonShadow() {
        mainButtonImageView.layer.shadowColor = UIColor.black.cgColor
        mainButtonImageView.layer.shadowOpacity = 0.5
        mainButtonImageView.layer.shadowOffset = CGSize(width: 1, height: 1)
        mainButtonImageView.layer.shadowRadius = 7
    }
    private func setupArrowAnimation() {
        // 2. Start AnimationView with animation name (without extension)
        animationView = .init(name: "arrow-down")
        animationView!.frame = arrowAnimationContainerView.bounds
        
        // 3. Set animation content mode
        animationView!.contentMode = .scaleAspectFit
        
        // 4. Set animation loop mode
        animationView!.loopMode = .loop
        
        // 5. Adjust animation speed
        animationView!.animationSpeed = 0.5
        arrowAnimationContainerView.addSubview(animationView!)
        
        // 6. Play animation
        animationView!.play()
    }
    
    // MARK: - IBAction
    
    @IBAction private func scheduleButtonPressed(_ sender: Any) {
        // TODO: open details view controller
        
        let message = Message(id: UUID().uuidString,
                              isRepeating: false,
                              quote: "MESSAGE",
                              author: "AUTHOR",
                              deadline: Date().advanced(by: 3))
        LocalNotificationManager.shared.scheduleNotification(with: message)
    }
}

//
//  SplashViewController.swift
//  AvengersApp
//
//  Created by Miguel Angel de la Torre on 01/05/2020.
//  Copyright © 2020  All rights reserved.
//

import UIKit
import Lottie


class SplashViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var animationView: LottieView!
    
    // MARK: - Private properties
    private let segueIdentifier = "SEGUE_FROM_SPLASH_TO_MAIN"
    private let lottieFile = "super_hero_lottie"
    private let lottieAnimationRepeat: Float = 3
    
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Show loading animation
        showLoading()
    }
    
    // MARK: Private methods
    private func showLoading() {
        // Create new animation lottie view
        let animationViewLottie = AnimationView(name: lottieFile)
        // Set animation repeat mode
        animationViewLottie.loopMode = .repeat(lottieAnimationRepeat)
        
        var frame = animationViewLottie.frame
        frame.size.width = frame.size.width / 2.7
        frame.size.height = frame.size.height / 2.7
        
        animationViewLottie.frame = frame
        
        
        // Add animation view frame to set animation size
        animationViewLottie.frame(forAlignmentRect: animationView.frame)
        
        // Add new lottie animation view to defined animationView
        animationView.addSubview(animationViewLottie)
        // Play lottie animation
        animationViewLottie.play { [weak self] isFinished in
            if (isFinished) {
                // Navigate to next screen with segue identifier
                self?.performSegue(withIdentifier: self?.segueIdentifier ?? "",
                                   sender: nil)
            }
        }
    }
}

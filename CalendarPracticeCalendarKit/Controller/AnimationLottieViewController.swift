//
//  AnimationLottieViewController.swift
//  CalendarPracticeCalendarKit
//
//  Created by Apple New on 2022-04-17.
//

import UIKit
import Lottie


class AnimationLottieViewController: UIViewController {
    
    let animation = AnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        animationPlay()
    
    }
    
    func animationPlay(){
        animation.frame = view.bounds
        animation.contentMode = .scaleAspectFit
        animation.loopMode = .loop
        animation.animation = Animation.named("91824-map-animation-lottie-italy")
        animation.play()
        view.addSubview(animation)
    }
   

}

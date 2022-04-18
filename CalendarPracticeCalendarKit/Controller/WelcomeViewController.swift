//
//  WelcomeViewController.swift
//  CalendarPracticeCalendarKit
//
//  Created by Apple New on 2022-04-14.
//

import UIKit
import Elements

class WelcomeViewController: UIViewController {
    
    lazy var startBTN : BaseUIButton = {
        let button = BaseUIButton()
        button.backgroundColor = .blue
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(tapHandler), for: .touchUpInside)

        return button
    }()
    
    lazy var eventBTN : BaseUIButton = {
        let button = BaseUIButton()
        button.backgroundColor = .blue
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(eventHandler), for: .touchUpInside)

        return button
    }()
    
    lazy var animationBTN : BaseUIButton = {
        let button = BaseUIButton()
        button.backgroundColor = .blue
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(animationHandler), for: .touchUpInside)

        return button
    }()
    
    lazy var stack : VStack = {
        let stack = VStack()
        stack.addArrangedSubview(startBTN)
        stack.addArrangedSubview(eventBTN)
        stack.addArrangedSubview(animationBTN)
        stack.spacing = 10
        return stack
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    

    @objc func tapHandler(){
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print("tapped")
    }
    
    @objc func eventHandler(){
        let vc = EventKitViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print("tapped")
    }
    
    @objc func animationHandler(){
        let vc = AnimationLottieViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print("tapped")
    }
}

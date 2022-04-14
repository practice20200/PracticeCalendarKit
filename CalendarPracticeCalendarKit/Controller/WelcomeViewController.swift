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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(startBTN)
        
        NSLayoutConstraint.activate([
            startBTN.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startBTN.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    

    @objc func tapHandler(){
        let vc = ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
        print("tapped")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

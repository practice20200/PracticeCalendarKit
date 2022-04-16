//
//  CalendarKitViewController.swift
//  CalendarPracticeCalendarKit
//
//  Created by Apple New on 2022-04-15.
//

import UIKit
import EventKit
import EventKitUI

class EventKitViewController : UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let adddBTN = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHandler))
        navigationItem.rightBarButtonItem = adddBTN
    }
    
    @objc func addHandler(){
        let vc = EKEventViewController()
        vc.delegate = self
        present(vc,animated: true)
    }
    

}


extension EventKitViewController : EKEventViewDelegate{
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
        
    }
    
    
}

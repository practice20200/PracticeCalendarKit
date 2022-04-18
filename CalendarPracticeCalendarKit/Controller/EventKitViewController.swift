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

    let store = EKEventStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let adddBTN = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHandler))
        navigationItem.rightBarButtonItem = adddBTN
    }
    
    @objc func addHandler(){
        store.requestAccess(to: .event) { [weak self] success, error in
            if success, error == nil {
                DispatchQueue.main.async {
                    guard let store = self?.store else { return }
                    let newEvent = EKEventEditViewController()
                    newEvent.eventStore = store
                    self?.present(newEvent, animated: true)
    
                    let vc = EKEventViewController()
                    vc.delegate = self
//                    vc.event = nil
                    self?.present(vc,animated: true)
                }
            }
        }
    }
}


extension EventKitViewController : EKEventViewDelegate{
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
}

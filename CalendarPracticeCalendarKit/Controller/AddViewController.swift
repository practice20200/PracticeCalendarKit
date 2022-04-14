//
//  AddViewController.swift
//  CalendarPracticeCalendarKit
//
//  Created by Apple New on 2022-04-13.
//

import UIKit
import Elements

class AddViewController: UIViewController {
    
    lazy var titleTF : BaseUITextField = {
        let tf = BaseUITextField()
        return tf
    }()
    
    lazy var descriptionTF : BaseUITextField = {
        let tf = BaseUITextField()
        return tf
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datepicker = UIDatePicker()
        return datepicker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        let saveBTN = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveHandler))
        navigationItem.rightBarButtonItem = saveBTN
    }
    

    @objc func saveHandler(){
        
    }
    

}

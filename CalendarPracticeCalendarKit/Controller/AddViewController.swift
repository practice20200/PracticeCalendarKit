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

        // Do any additional setup after loading the view.
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

//
//  AddViewController.swift
//  CalendarPracticeCalendarKit
//
//  Created by Apple New on 2022-04-13.
//

import UIKit
import Elements

class AddViewController: UIViewController {
    
    public var completion: ((String, String, Date) -> Void)?
    
    lazy var titleTF : BaseUITextField = {
        let tf = BaseUITextField()
        tf.widthAnchor.constraint(equalToConstant: 200).isActive = true
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tf.backgroundColor = .systemGray4
        return tf
    }()
    
    lazy var descriptionTF : BaseUITextField = {
        let tf = BaseUITextField()
        tf.widthAnchor.constraint(equalToConstant: 200).isActive = true
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tf.backgroundColor = .systemGray4
        return tf
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datepicker = UIDatePicker()
        return datepicker
    }()
    
    lazy var contentStack : VStack = {
        let stack = VStack()
        stack.addArrangedSubview(titleTF)
        stack.addArrangedSubview(descriptionTF)
        stack.addArrangedSubview(datePicker)
        stack.spacing = 10
        return stack
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentStack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        

        let saveBTN = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveHandler))
        navigationItem.rightBarButtonItem = saveBTN
    }
    

    @objc func saveHandler(){
        if let titleText = titleTF.text, !titleText.isEmpty,
           let descriptionText = descriptionTF.text, !descriptionText.isEmpty {
            let targetDate = datePicker.date
            
            completion?(titleText, descriptionText, targetDate)
        }
    }
    

}

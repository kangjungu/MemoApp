//
//  AddMemoViewController.swift
//  
//
//  Created by JHJG on 2016. 4. 3..
//
//

import UIKit

class AddMemoViewController: UIViewController {

    
    @IBOutlet weak var setTitle: UITextField!
    @IBOutlet weak var setContent: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func onAddAction(sender: AnyObject) {
        let id = MemoDBManger.instance.generateId()
        print("id : \(id)")
        let data: MemoData = MemoData()
        data.id = id
        data.title = setTitle.text!
        data.content = setContent.text!
        let todaysDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy MM dd"
        let DateInFormat = dateFormatter.stringFromDate(todaysDate)
        data.date = DateInFormat
        
        MemoDBManger.instance.add(data)
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    


}

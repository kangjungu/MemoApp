//
//  UpdateMemoViewController.swift
//  MemoApp
//
//  Created by JHJG on 2016. 4. 6..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class UpdateMemoViewController: UIViewController {

    @IBOutlet weak var updateTitle: UITextField!
    @IBOutlet weak var updateContent: UITextView!
    
    //변수를 만들어 데이터를 저장
    var sendTitle = ""
    var sendContent = ""
    var id: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //가져온 정보를 넣어준다.
        updateTitle.text = sendTitle
        updateContent.text = sendContent
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSaveClick(sender: UIButton) {
        let data: MemoData = MemoData()
        
        if let a = id {
            print("id 들어갔다 \(a)")
            data.id = a
        }
        
        data.title = updateTitle.text!
        data.content = updateContent.text!
        let todaysDate = NSDate()
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy MM dd"
        let DateInFormat = dateFormatter.stringFromDate(todaysDate)
        data.date = DateInFormat
        
        MemoDBManger.instance.update(data)

    }


}

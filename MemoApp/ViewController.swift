//
//  ViewController.swift
//  MemoApp
//
//  Created by JHJG on 2016. 4. 3..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var items = MemoDBManger.instance.getList()
    var memoData : MemoData?
    @IBOutlet var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //section 갯수
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //row 갯수
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    //table item 클릭시
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("item click")
        memoData = items[indexPath.row]
        
        self.performSegueWithIdentifier("UPDATE", sender: self)
        
    }
    //cell에 데이터를 넣어주는 함수
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CUSTOM_CELL", forIndexPath: indexPath) as! MemoCell
        
        cell.title.text = items[indexPath.row].title
        cell.content.text = items[indexPath.row].content
        cell.date.text = items[indexPath.row].date
        
        return cell;
    }
    
    //editing모드로 진입했을때 스타일 지정
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    
    
    //editing모드에서의 이벤트를 가져온다.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            print(indexPath.row)
            memoData = items[indexPath.row]
            
            if let a = memoData{
                MemoDBManger.instance.delete(a)
            }
            
            tableView.reloadData()
        }
    }
    
    //add or update 한 후 view를 다시그려준다
    override func viewWillAppear(animated: Bool) {
        mTableView.reloadData()
    }
    
    //뷰의 높이를 정해줌?
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    //edit 버튼 누른경우
    @IBAction func onEditClick(sender: UIBarButtonItem) {
        //edit button action
        //editing 모드로 들어갈수 있게해줌
        //여기서 나오는 버튼은 위의 func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle { 쪽에서 바꿔줄수 있다.
        mTableView.setEditing(!mTableView.editing, animated: true)
    }
    
    //segue로 데이터 전달 (intent ?)
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "UPDATE"{
            let send = segue.destinationViewController as! UpdateMemoViewController
            
            print("1\(memoData?.title)")
            if let a = memoData?.title{
                send.sendTitle = String(a)
            }
            if let a = memoData?.content{
                send.sendContent = String(a)
            }
            
            
            if let a = memoData?.id{
                send.id = Int(a)
            }
        }
        
    }
    //segue를 취소할때 사용할 함수
    @IBAction func myExit(sender: UIStoryboardSegue){
        
    }
    
}


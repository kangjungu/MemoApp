//
//  MemoDBManager.swift
//  MemoApp
//
//  Created by JHJG on 2016. 4. 3..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import Foundation
import RealmSwift

class MemoDBManger{
    
    //singleton패턴
    static let instance = MemoDBManger();
    
    //realm 객체를 가져옴
    let realm = try! Realm()
    
    //generate id
    func generateId() -> Int{
        let results = realm.objects(MemoData).sorted("id", ascending: true)
        if results.count == 0 {
            return 0
        }else{
            print("id \(results.last!.id) title \(results.last?.title)")
            return ((results.last?.id)! + 1)
        }
    }
    //add
    func add(data : MemoData){
        try! realm.write({
            realm.add(data)
        })
    }
    
    //delete
    func delete(data : MemoData){
        try! realm.write({
//            realm.delete(realm.objects(MemoData).filter("id = \(id)"))
            realm.delete(data)
        })
    }
    
    //update
    func update(data : MemoData){
        try! realm.write({
//            realm.add(realm.objects(MemoData).filter("id = \(id)"), update: true)
            realm.add(data, update: true)
        })
    }
    
    //get item
    func getMemoData(id : Int) -> MemoData{
        try! realm.write {
            return realm.objects(MemoData).filter("id = \(id)")
        }
        return MemoData();
    }
    
    
    //get list
    func getList() -> Results<MemoData>{
        return realm.objects(MemoData)
    }
    
    //객체 업데이트: 필드 업그레이드 가능한듯
//    // Update an object with a transaction
//    try! realm.write {
//    author.name = "Thomas Pynchon"
//    }

}

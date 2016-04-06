//
//  MemoData.swift
//  MemoApp
//
//  Created by JHJG on 2016. 4. 3..
//  Copyright © 2016년 KangJungu. All rights reserved.
//

import Foundation
import RealmSwift

class MemoData: Object {
    
    dynamic var id = 0
    dynamic var title = ""
    dynamic var content = ""
    dynamic var date = ""
    
    //기본키 리턴
    override static func primaryKey() -> String? {
        return "id"
    }
}

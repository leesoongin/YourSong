//
//  OwnMusicList.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/26.
//

import UIKit
import RealmSwift

class OwnMusicList: Object {
    @objc dynamic var name: String = ""
    let items = List<OwnMusic>()
    
    func setName(_ name: String){
        self.name = name
    }
    func add(_ ownMusic: OwnMusic){
        self.items.append(ownMusic)
    }
    
    override class func primaryKey() -> String? {
        return "name"
    }

}

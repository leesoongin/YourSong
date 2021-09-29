//
//  OwnMusicList.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/26.
//

import UIKit
import RealmSwift

class OwnMusicList: Object {
    @objc dynamic private var id: Int = 0
    @objc dynamic private var name: String = ""
    let items = List<OwnMusic>()
    
    //getter
    func getId() -> Int{
        return self.id
    }
    func getName() -> String{
        return self.name
    }
    func getItems()-> List<OwnMusic>{
        return self.items
    }
    
    //setter
    func setId(_  id: Int){
        self.id = id
    }
    func setName(_ name: String){
        self.name = name
    }
    func add(_ ownMusic: OwnMusic){
        self.items.append(ownMusic)
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }

}

//
//  OwnListDataManager.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/27.
//

import UIKit
import RealmSwift
// ownMusic + name -> OwnMusicList

class OwnListDataManager {
    static let shared = OwnListDataManager()
    private let realm = try! Realm()
    private init() {}
    
    private var ownLists: [OwnMusicList] = [OwnMusicList]()
    
    // Create
    func addOwnList(ownMusic: OwnMusic, name: String){
        let ownList = OwnMusicList()
        ownList.setName(name)
        ownList.add(ownMusic)
        do{
            try realm.write{
                realm.add(ownList)
            }
        }catch let error{
            print("error -> \(error.localizedDescription)")
        }
    }
    
    //Read
    func readData(){
        var person: Results<OwnMusicList>
        
        person = realm.objects(OwnMusicList.self)
        
        for element in person {
            print("element --> \(element)")
        }
    }
 
}

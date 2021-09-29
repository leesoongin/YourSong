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
    private var titles: [String] = [String]()
    
    //getter
    func getOwnLists() -> [OwnMusicList]{
        return self.ownLists
    }
    func getOwnListTitles() -> [String]{
        self.titles.removeAll()
        
        for list in self.ownLists{
            self.titles.append(list.getName())
        }
        return self.titles
    }
    
    // Create
    func createOwnList(name: String){
        var id = 0
        if let lastList = realm.objects(OwnMusicList.self).last {
               id = lastList.getId() + 1
           }
        let ownList = OwnMusicList()
        ownList.setId(id)
        ownList.setName(name)
        
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
        var ownList: Results<OwnMusicList>

        ownList = realm.objects(OwnMusicList.self)
        
        self.ownLists.removeAll()
        self.ownLists.append(contentsOf: ownList)
        print("--> \(ownLists)")
    }
    
    //Update
    func addOwnMusic(ownMusic: OwnMusic, titleName: String){
        var data: Results<OwnMusicList>
        data = realm.objects(OwnMusicList.self).filter("name == '\(titleName)'")
        
        do{
            try realm.write{
                data[0].items.append(ownMusic)
            }
        }catch let error {
            print("error --> \(error.localizedDescription)")
        }
    }
    
    func findUrl(){
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
}

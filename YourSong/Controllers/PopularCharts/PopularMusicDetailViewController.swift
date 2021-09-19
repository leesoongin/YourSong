//
//  PopularMusicDetailViewController.swift
//  YourSong
//
//  Created by 이숭인 on 2021/09/20.
//

import UIKit

class PopularMusicDetailViewController: UIViewController {

    var selectedMusic: PopularChartMusic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white

        guard let selectedMusic = self.selectedMusic else {
            print("selectedMusic is nil")
            return
        }
        
        print("selected --> \(selectedMusic)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

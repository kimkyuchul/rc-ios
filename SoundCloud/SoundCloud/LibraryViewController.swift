//
//  LibraryViewController.swift
//  SoundCloud
//
//  Created by qualson1 on 2022/07/01.
//

import UIKit

class LibraryViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
  
    
    
    @IBOutlet var libraryTableView: UITableView!
    
    let tableViewArray :[String] = ["Liked Tracks", "Playlists", "Albums", "Following", "Stations"]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        libraryTableView.delegate = self
        libraryTableView.dataSource = self

        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = libraryTableView.dequeueReusableCell(withIdentifier: "LibrayCell") else { return UITableViewCell() }
        
        cell.textLabel?.text = self.tableViewArray[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.black
        cell.textLabel?.font = UIFont(name: "Interstate", size: 20.0)
        
        return cell
        
    }

}

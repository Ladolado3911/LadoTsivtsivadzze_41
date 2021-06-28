//
//  ViewController.swift
//  LadoTsivtsivadzze_41
//
//  Created by lado tsivtsivadze on 6/28/21.
//

import UIKit

typealias Table = UITableViewDataSource & UITableViewDelegate

class ReminderController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FilesManager().createDirectory(name: "good")
        //FilesManager().getDirUrl(dirName: "good")
        //print(FilesManager().directories)
        //print(FilesManager().getContentsofDirectory(dirname: "good"))
        //print(FilesManager().getContentsofDirectory(dirname: "something"))
        //FilesManager().createReminderTxt(name: "text2", dirName: "good")
        //print(FilesManager().appUrl)
    }
    
    func configTableView() {
        tblView.dataSource = self
        tblView.delegate = self
        
        
    }
}

extension ReminderController: Table {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


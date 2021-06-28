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
        //FilesManager().getDirUrl(dirName: "good")
        FilesManager().createReminderTxt(name: "text1", dirName: "good")
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


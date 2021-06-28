//
//  ReminderCell.swift
//  LadoTsivtsivadzze_41
//
//  Created by lado tsivtsivadze on 6/28/21.
//

import UIKit

class ReminderCell: UITableViewCell {
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    var category: String?
    
    var fileManager = FilesManager()
    
    var contents: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        guard let category = category else { return }
        configTblView()
        contents = fileManager.getContentsofDirectory(dirname: category) ?? [""]
        categoryName.text = category
        tblView.reloadData()
 
    }
    
    func configTblView() {
        tblView.dataSource = self
        tblView.delegate = self
        
        let nib = UINib(nibName: "ContentCell", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "ContentCell")
        
        tblView.reloadData()
    }
    
    func configCell(categoryName name: String) {
        categoryName.text = name
        contents = fileManager.getContentsofDirectory(dirname: name) ?? [""]
        //tblView.reloadData()
        print(contents)
    }
    
    @IBAction func onAddReminder(_ sender: Any) {
        print("clicked")
    }
}

extension ReminderCell: Table {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(contents.count)
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell") as? ContentCell
        print(contents[indexPath.row])
        //cell!.configCell(content: contents[indexPath.row])
        cell!.content2 = contents[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        20
    }
}

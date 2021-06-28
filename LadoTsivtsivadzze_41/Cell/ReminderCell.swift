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
    
    private var fileManager = FilesManager()
    
    var contents: [String] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configTblView()
        
        
    }
    
    func configTblView() {
        tblView.dataSource = self
        tblView.delegate = self
        
        let nib = UINib(nibName: "ContentCell", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "ContentCell")
    }
    
    func configCell(categoryName name: String) {
        categoryName.text = name
        contents = fileManager.getContentsofDirectory(dirname: name) ?? [""]
    }
}

extension ReminderCell: Table {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell") as? ContentCell
        cell!.configCell(content: contents[indexPath.row])
        return cell!
    }
}
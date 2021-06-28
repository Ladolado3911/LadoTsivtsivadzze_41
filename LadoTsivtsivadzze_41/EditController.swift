//
//  EditController.swift
//  LadoTsivtsivadzze_41
//
//  Created by lado tsivtsivadze on 6/28/21.
//

import UIKit

class EditController: UIViewController {
    
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    var categoryName2: String?
    var content: String?
    
    private var fileManager = FilesManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()


    }
    
    func configTableView() {
        tblView.dataSource = self
        tblView.delegate = self
        
        let nib = UINib(nibName: "Cell3", bundle: nil)
        tblView.register(nib, forCellReuseIdentifier: "Cell3")
    }
}

extension EditController: Table {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let category = categoryName2 else { return 0 }
        return fileManager.getContentsofDirectory(dirname: category)!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let category = categoryName2 else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3") as? Cell3
        cell!.title2 = fileManager.getContentsofDirectory(dirname: category)![indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ContentController") as? ContentController
        //vc!.contentTxt = 
    }
}

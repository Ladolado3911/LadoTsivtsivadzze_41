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
    }
}

extension EditController: Table {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let category = categoryName2 else { return 0 }
        fileManager.getContentsofDirectory(dirname: category)!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return UITableViewCell()
    }
}

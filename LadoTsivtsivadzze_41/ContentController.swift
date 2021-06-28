//
//  ContentController.swift
//  LadoTsivtsivadzze_41
//
//  Created by lado tsivtsivadze on 6/28/21.
//

import UIKit

class ContentController: UIViewController {
    
    @IBOutlet weak var contentView: UITextView!
    var contentTxt: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let contentTxt = contentTxt else { return }
        contentView.text = contentTxt
    }
}

//
//  FilesManager.swift
//  LadoTsivtsivadzze_41
//
//  Created by lado tsivtsivadze on 6/28/21.
//

import Foundation
import UIKit

class FilesManager {
    
    let fileManager = FileManager.default
    
    var appUrl: URL? {
        try? fileManager.url(for: .applicationSupportDirectory,
                        in: .allDomainsMask,
                        appropriateFor: nil,
                        create: false)
    }
    
    func createDirectory(name dirName: String) {
        let dirUrl = appUrl?.appendingPathComponent("\(dirName)")
        try? fileManager.createDirectory(at: dirUrl!,
                                        withIntermediateDirectories: true,
                                        attributes: nil)
        print(dirUrl)
    }
}

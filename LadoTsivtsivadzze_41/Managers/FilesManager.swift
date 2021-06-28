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
    
    var directories: [String] {
        guard let content = try? fileManager.contentsOfDirectory(at: appUrl!,
                                                      includingPropertiesForKeys: nil,
                                                      options: .skipsHiddenFiles) else { return [""] }
        return content.map { $0.lastPathComponent }
    }
    
    func createDirectory(name dirName: String) {
        let dirUrl = appUrl?.appendingPathComponent("\(dirName)")
        try? fileManager.createDirectory(at: dirUrl!,
                                        withIntermediateDirectories: true,
                                        attributes: nil)
        print(type(of: dirUrl))
    }
    
    func createReminderTxt(name txtName: String, dirName name: String) {
        let dirUrl = appUrl?.appendingPathComponent("\(name)")
        let txtUrl = dirUrl?.appendingPathComponent("\(txtName).txt")
        let content = txtName
        
        try? content.write(to: txtUrl!, atomically: true, encoding: .utf8)
    }
    
    func getContentsofDirectory(dirname name: String) -> [String]? {
        let dirUrl = appUrl?.appendingPathComponent("\(name)")
        guard let content = try? fileManager.contentsOfDirectory(at: dirUrl!,
                                                                 includingPropertiesForKeys: nil,
                                                                 options: .skipsHiddenFiles) else { return nil }
        
        return content.map { try! String(contentsOf: $0, encoding: .utf8) }
    }
}

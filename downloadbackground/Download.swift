//
//  Download.swift
//  downloadbackground
//
//  Created by Josaphat Campos Pereira on 29/03/23.
//

import Foundation

class Download: NSObject{
    var url:URL
    var task: URLSessionDownloadTask?
    
    init(url:URL){
        self.url = url
    }
}

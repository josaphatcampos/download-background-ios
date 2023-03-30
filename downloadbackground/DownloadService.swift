//
//  DownloadService.swift
//  downloadbackground
//
//  Created by Josaphat Campos Pereira on 29/03/23.
//

import Foundation

class DownloadService{
    var downloadsSession: URLSession!
    var activeDownloads: [URL:Download] = [:]
    
    func startDownload(_ track:URL){
        let download =  Download(url: track)
        download.task = downloadsSession.downloadTask(with: track)
        download.task!.resume()
        activeDownloads[download.url] = download
    }
    
}

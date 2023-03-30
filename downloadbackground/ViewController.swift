//
//  ViewController.swift
//  downloadbackground
//
//  Created by Josaphat Campos Pereira on 29/03/23.
//

import UIKit

class ViewController: UIViewController {
    
    let downloadService = DownloadService()
    
    let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    lazy var downloadSession: URLSession = {
        let configuration =  URLSessionConfiguration.background(withIdentifier: "br.com.jocampos.bkgsessionconfiguration")
        return URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
    }()
    
    lazy var downloadButton:UIButton = {
        let download = UIButton(frame: .zero)
        download.backgroundColor = .black
        download.setTitle("Baixar", for: .normal)
        download.translatesAutoresizingMaskIntoConstraints = false
        download.layer.cornerRadius = 5
        download.addTarget(self, action: #selector(downloadTapped), for: .touchUpInside)
        return download
    }()
    
    lazy var downloadLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Clique para Baixar"
        label.textAlignment = .center
        return label
    }()
    
    func localFilePath(for url: URL) -> URL {
        return documentPath.appendingPathComponent(url.lastPathComponent)
    }
    
    @objc
    func downloadTapped(_ sender: UIButton){
        for url in urlDownloads{
            downloadService.startDownload(URL(string: url)!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        view.addSubview(downloadLabel)
        view.addSubview(downloadButton)
        setupConstraints()
        
        downloadService.downloadsSession = downloadSession
        
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            downloadLabel.heightAnchor.constraint(equalToConstant: 50),
            downloadLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
            downloadLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            downloadButton.leadingAnchor.constraint(equalTo: downloadLabel.leadingAnchor),
            downloadButton.trailingAnchor.constraint(equalTo: downloadLabel.trailingAnchor),
            downloadButton.heightAnchor.constraint(equalToConstant: 50),
            downloadButton.topAnchor.constraint(equalTo: downloadLabel.bottomAnchor, constant: 20),
        ])
    }
}


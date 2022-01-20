//
//  SourceImageViewController.swift
//  ImagesProvider
//
//  Created by Roman Korobskoy on 20.01.2022.
//

import UIKit
import SafariServices

class SourceImageViewController: UIViewController {

    var urlString = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSource(withUrl: urlString)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showSource(withUrl: urlString)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dismiss(animated: true, completion: nil)
    }
    
    func showSource(withUrl: String) {
        let url = URL(string: withUrl)
        print(url!)
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        let vc = SFSafariViewController(url: url!, configuration: config)
        present(vc, animated: true, completion: nil)
    }
}

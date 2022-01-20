//
//  SourceImageViewController.swift
//  ImagesProvider
//
//  Created by Roman Korobskoy on 20.01.2022.
//

import UIKit
import WebKit

class SourceImageViewController: UIViewController {

    var urlString = "google.com/"
    
    @IBOutlet var imageWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: urlString)
        print(url)
        let request = URLRequest(url: url!)
        imageWebView.load(request)
    }
}

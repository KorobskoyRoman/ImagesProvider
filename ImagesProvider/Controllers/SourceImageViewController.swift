//
//  SourceImageViewController.swift
//  ImagesProvider
//
//  Created by Roman Korobskoy on 20.01.2022.
//

import UIKit
import WebKit
import SafariServices

class SourceImageViewController: UIViewController {

    var urlString = ""
    var safariVC: SFSafariViewController?
    
    @IBOutlet var imageWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let url = URL(string: urlString)
//        print(url)
//        let request = URLRequest(url: url!)
//        imageWebView.load(request)
        
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
        vc.delegate = self
        present(vc, animated: true, completion: nil)
    }
}

extension SourceImageViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
//        controller.dismiss(animated: true, completion: nil)
//        present(SearchViewController(), animated: true, completion: nil)
        let detailsVC = DetailsViewController()
        dismiss(animated: true, completion: nil)
        detailsVC.dismiss(animated: true, completion: nil)
        controller.present(detailsVC, animated: true, completion: nil)
        print("safari dismiss")
    }
    
}

//
//  DetailsViewController.swift
//  ImagesProvider
//
//  Created by Roman Korobskoy on 17.01.2022.
//

import UIKit
import Nuke

class DetailsViewController: UIViewController {

    var imageModel: String = ""
    @IBOutlet var imageDetail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        set(image: imageModel)
    }
    
    func set(image: String) {
        Nuke.loadImage(with: imageModel, into: imageDetail)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSource" {
            let destVC = segue.destination as! SourceImageViewController
            let image = imageModel
            destVC.urlString = image
        }
    }
}

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
        Nuke.loadImage(with: imageModel, into: imageDetail)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

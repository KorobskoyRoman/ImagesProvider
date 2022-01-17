//
//  ImagesCell.swift
//  ImagesProvider
//
//  Created by Roman Korobskoy on 17.01.2022.
//

import UIKit
import Nuke

protocol ImageCellProtocol {
    var description: String { get }
}

class ImagesCell: UICollectionViewCell {
    
    var image: ImageModel!
    @IBOutlet var searchImage: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        searchImage.contentMode = .scaleAspectFill
    }
}

//
//  ImageModel.swift
//  ImagesProvider
//
//  Created by Roman Korobskoy on 17.01.2022.
//

import Foundation

struct ImageModel {
    let images: [String]
    
    init?(imageData: ImageData) {
        var tempArray: [String] = []
        imageData.imagesResults.forEach { image in
            tempArray.append(image.original)
        }
        self.images = tempArray
    }
}


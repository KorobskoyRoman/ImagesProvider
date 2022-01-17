//
//  ImageData.swift
//  ImagesProvider
//
//  Created by Roman Korobskoy on 17.01.2022.
//

import Foundation

struct ImageData: Codable {
    let imagesResults: [ImagesResult]

    enum CodingKeys: String, CodingKey {
        case imagesResults = "images_results"
    }
}

struct ImagesResult: Codable {
    let original: String
}

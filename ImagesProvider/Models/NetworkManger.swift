//
//  NetworkManger.swift
//  ImagesProvider
//
//  Created by Roman Korobskoy on 17.01.2022.
//

import Foundation

class NetworkManger {
    func fetchImages(searchText: String, completion: @escaping (ImageModel) -> Void) {
        let apiKey = "fc64bba2485c8ad93447aa6f6e482124474ead2424b64226afbca932023ed9c1"
        let urlString = "https://serpapi.com/search?q=\(searchText)&tbm=isch&ijn=0&engine=google&api_key=\(apiKey)"
        guard let urlString = URL(string: urlString) else { return }
        
        var request = URLRequest(url: urlString, timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: urlString) { data, response, error in
            guard let data = data else {
                print("error getting data")
                return
            }
            if let imageModel = self.parseJSON(withData: data) {
                print("данные из менеджера: \(imageModel)")
                completion(imageModel)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> ImageModel? {
        let decoder = JSONDecoder()
        do {
            let imageData = try decoder.decode(ImageData.self, from: data)
            guard let imageModel = ImageModel(imageData: imageData) else { return nil }
            print("данные из парсинга: \(imageData)")
            return imageModel
        } catch let error {
            print("error: \(error)")
        }
        return nil
    }
}

//
//  ItemsData.swift
//  OpenDota+
//
//  Created by 姚一鸣 on 2021/10/4.
//

import SwiftUI
import UIKit

enum MethodType {
    case get
    case post
}

enum NetworkError: Error {
    case invalidResponse
    case nilResponse
}

//class NetworkManager<T: Codable> {
//    // 网络请求
//    static func requestData(_ type: MethodType,
//                           URLString: String,
//                           parameters: [String : Any]?,
//                           completion: @escaping (Result<T, NetworkError>) -> Void) {
//
//        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
//
//        AF.request(URLString, method: method, parameters: parameters, encoding: URLEncoding.httpBody)
//            .validate()
//            .responseDecodable(of: T.self) { response in
//                if let value = response.value {
//                    completion(.success(value))
//                    return
//                }
//
//                if let error = response.error {
//                    completion(.failure(.invalidResponse))
//                    return
//                }
//
//                completion(.failure(.nilResponse))
//        }
//    }
//}

//let landmarkData: [Landmark] = load("landmarkData.json")
//let hikeData: [Hike] = load("hikeData.json")
//
//func load<T: Decodable>(_ filename: String) -> T {
//    let data: Data
//
//    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
//    }
//
//    do {
//        let decoder = JSONDecoder()
//        return try decoder.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
//    }
//}

//final class ImageStore {
//    typealias _ImageDictionary = [String: CGImage]
//    fileprivate var images: _ImageDictionary = [:]
//
//    fileprivate static var scale = 2
//
//    static var shared = ImageStore()
//
//    func image(name: String) -> Image {
//        let index = _guaranteeImage(name: name)
//
//        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
//    }
//
//    static func loadImage(name: String) -> CGImage {
//        guard
//            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
//            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
//            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
//        else {
//            fatalError("Couldn't load image \(name).jpg from main bundle.")
//        }
//        return image
//    }
//
//    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
//        if let index = images.index(forKey: name) { return index }
//
//        images[name] = ImageStore.loadImage(name: name)
//        return images.index(forKey: name)!
//    }
//}

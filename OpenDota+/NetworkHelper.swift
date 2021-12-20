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

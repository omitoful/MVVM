//
//  APIManager.swift
//  MVVM-ex
//
//  Created by 陳冠甫 on 2023/9/14.
//

import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

//typealias Handler = (Result<[Product], DataError>) -> Void
typealias Handler<T> = (Result<T, DataError>) -> Void

class APIManager {
    
    static let shared = APIManager()
    static var commonHeaders: [String: String] {
        return ["Content-Type": "application/json"]
    }
    private init() {}
    
    func request<T: Decodable >(
        modelType: T.Type,
        type: EndPointType,
        completion: @escaping Handler<T>
    ) {
        guard let url = type.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.methods.rawValue
        if let para = type.body {
            request.httpBody = try? JSONEncoder().encode(para)
        }
        request.allHTTPHeaderFields = type.headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode(modelType, from: data)
                completion(.success(products))
                
            } catch {
                completion(.failure(.network(error)))
            }
            
        }.resume()
    }
    
    /*
    func fetchProducts(completion: @escaping Handler) {
        guard let url = URL(string: Constant.API.productURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
                
            } catch {
                completion(.failure(.network(error)))
            }
            
        }.resume()
    }
    */
}

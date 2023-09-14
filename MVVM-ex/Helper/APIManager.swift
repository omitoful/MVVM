//
//  APIManager.swift
//  MVVM-ex
//
//  Created by 陳冠甫 on 2023/9/14.
//

import UIKit

class APIManager {
    
    static let shared = APIManager()
    private init() {}
    
    func fetchProducts() {
        guard let url = URL(string: Constant.API.productURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data, error == nil else { return }
            guard let response = response as? HTTPURLResponse,
                  200 ... 299 ~= response.statusCode else { return }
            
            do {
                let product = try JSONDecoder().decode(Product.self, from: data)
                
            } catch {
                
            }
            
        }.resume()
    }
}

//
//  AddProductViewController.swift
//  MVVM-ex
//
//  Created by 陳冠甫 on 2023/9/18.
//

import UIKit

class AddProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        addProduct()
    }

//    func addProduct() {
//        guard let url = URL(string: "https://dummyjson.com/products/add") else { return }
//
//        let para = AddProduct(title: "BMW car")
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = try? JSONEncoder().encode(para)
//        request.allHTTPHeaderFields = [
//            "Content-Type": "application/json"
//        ]
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let data else { return }
//            do {
//                let productResponse = try JSONDecoder().decode(AddProduct.self, from: data)
//                print(productResponse)
//            } catch {
//                print(error)
//            }
//        }.resume()
//    }
}

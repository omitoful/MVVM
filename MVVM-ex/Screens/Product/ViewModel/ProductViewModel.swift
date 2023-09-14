//
//  ProductViewModel.swift
//  MVVM-ex
//
//  Created by 陳冠甫 on 2023/9/14.
//

import Foundation

final class ProductViewModel {
    
    var products: [Product] = []
    var eventHandler: ((_ event: Event) -> Void)? // Data Binding Closure
    
    func fetchProduct() {
        APIManager.shared.fetchProducts { response in
            switch response {
            case .success(let products):
                self.products = products
            case .failure(let error):
                print(error)
            }
        }
    }
}

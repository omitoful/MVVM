//
//  ProductListViewController.swift
//  MVVM-ex
//
//  Created by 陳冠甫 on 2023/9/14.
//

import UIKit

class ProductListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.shared.fetchProducts { response in
            switch response {
            case .success(let products):
                print(products)
            case .failure(let error):
                print(error)
            }
        }
    }
}

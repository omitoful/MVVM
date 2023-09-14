//
//  Product.swift
//  MVVM-ex
//
//  Created by 陳冠甫 on 2023/9/14.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rate
}

struct Rate: Decodable {
    let rate: Float
    let count: Int
}

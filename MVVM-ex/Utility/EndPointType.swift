//
//  EndPointType.swift
//  MVVM-ex
//
//  Created by 陳冠甫 on 2023/9/15.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
 }

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var methods: HTTPMethods { get }
}

enum EndPointItems {
    case products
}

// https://fakestoreapi.com/products
extension EndPointItems: EndPointType {
    var path: String {
        switch self {
        case .products:
            return "products"
        }
    }
    
    var baseURL: String {
        return "https://fakestoreapi.com/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var methods: HTTPMethods {
        switch self {
        case .products:
            return .get
        }
    }
}

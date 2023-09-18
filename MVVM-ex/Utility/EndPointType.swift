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
    var body: Encodable? { get }
    var headers: [String: String]? { get }
}

enum EndPointItems {
    case products
    case addProducts(product: AddProduct)
}

// https://fakestoreapi.com/products
extension EndPointItems: EndPointType {
    var path: String {
        switch self {
        case .products:
            return "products"
        case .addProducts:
            return "products/add"
        }
    }
    
    var baseURL: String {
        switch self {
        case .products:
            return "https://fakestoreapi.com/"
        case .addProducts:
            return "https://dummyjson.com/"
        }
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var methods: HTTPMethods {
        switch self {
        case .products:
            return .get
        case .addProducts:
            return .post
        }
    }
    
    var body: Encodable? {
        switch self {
        case .products:
            return nil
        case .addProducts(let product):
            return product
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .products:
            return nil
        case .addProducts:
            return APIManager.commonHeaders
        }
    }
}

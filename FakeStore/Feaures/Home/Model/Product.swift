//
//  Product.swift
//  FakeStore
//
//  Created by Mihai Cerneanu on 20.02.2023.
//

import Foundation


struct Product: Identifiable, Codable {
    var id: Int
    var title: String
    var price: Double
    var description: String
    var category: String
    var image: String
    var rating: Rate
}

struct Rate: Codable {
    var rate: Double
    var count: Double
    
}

extension Product {
    static var mockData: Product = Product(id: 1, title: "Tricou", price: 13.1, description: "tricou de iarna gros dasiobfdisufbasiubgeiubieubfveiwu fei fbsdu buyv dsyu cvsdcuy vcdsy vcsduy vdsuyf bsdauds", category: "Barbati", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rate(rate: 5, count: 121))
}

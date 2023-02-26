//
//  HomeViewModel.swift
//  FakeStore
//
//  Created by Mihai Cerneanu on 20.02.2023.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var searchText = ""
    @Published var filteredProducts: [Product] = []
    
    func fetchData() async {
        let decoder = JSONDecoder()
        let url = URL(string: "https://fakestoreapi.com/products")!

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let userData = try?  decoder.decode([Product].self, from: data) {
                products = userData
            }
        } catch {
            print(error)
        }
    }
    
    func filterContents() {
        if !searchText.isEmpty {
            products.forEach { product in
            filteredProducts = products.filter{ $0.title.contains(searchText) }
            }
        } else {
            filteredProducts = products
        }
    }
}

//List(products.products.filter({ searchText.isEmpty ? true : $0.title.contains(searchText) }))

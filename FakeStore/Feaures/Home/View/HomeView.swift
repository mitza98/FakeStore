//
//  ContentView.swift
//  FakeStore
//
//  Created by Mihai Cerneanu on 20.02.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var products: HomeViewModel = HomeViewModel()
    @State private var searchText = ""
    var body: some View {
            NavigationView {
                VStack {
                    List(products.filteredProducts) { product in
                        NavigationLink {
                            ProductDetails(product: product)
                        } label: {
                            ProductView(product: product)
                        }
                    }
                    .listStyle(.plain)
                    //.padding()
                    .task {
                        await products.fetchData()
                        products.filteredProducts = products.products
                    }
                    
                }
                .navigationTitle("Home")
                .searchable(text: $products.searchText, prompt: "Search for a product")
            }
            
            .ignoresSafeArea()
            .onChange(of: products.searchText) { text in
                products.filterContents()
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

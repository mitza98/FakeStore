//
//  ProductDetails.swift
//  FakeStore
//
//  Created by Mihai Cerneanu on 26.02.2023.
//

import SwiftUI

struct ProductDetails: View {
    var product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                   // .clipShape(Circle())
                    .frame(width: 200, height: 200)
                   // .background(.red)
            } placeholder: {
                ProgressView()
            }
            Spacer()
            ZStack {
                LinearGradient(colors: [.white, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
                VStack {
                    Text(product.title)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    Text("Price: $" + String.init(format: "%0.2f", product.price))
                        .foregroundColor(.white)
                    RatingView(rating: Int(product.rating.rate))
                    Text("(" + String.init(format: "%0.0f", product.rating.rate) + " votes)")
                    Spacer()
                    Text(product.description)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(.white)
                        //.offset(y: -90)
                    Spacer()
                }
               // .offset(y: 10)
                .padding()
                
            }
        }
        //.ignoresSafeArea()
        //.background(.red)
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(product: Product.mockData)
    }
}

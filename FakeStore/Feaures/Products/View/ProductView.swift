//
//  ProductView.swift
//  FakeStore
//
//  Created by Mihai Cerneanu on 22.02.2023.
//

import SwiftUI

struct ProductView: View {
    var product: Product
    var body: some View {
        HStack(alignment: .center) {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading) {
                Text(product.title)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.black)
                Text("Price: $" + String.init(format: "%0.2f", product.price))
                    .foregroundColor(.gray)
                RatingView(rating: Int(product.rating.rate))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(.white)
        .cornerRadius(5)
        .padding()
        
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: Product.mockData)
    }
}

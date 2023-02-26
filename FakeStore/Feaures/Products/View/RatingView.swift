//
//  RatingView.swift
//  FakeStore
//
//  Created by Mihai Cerneanu on 22.02.2023.
//

import SwiftUI

struct RatingView: View {
    @State var rating: Int
    var maximumRating = 5
    var label = ""
    
    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

     var offColor = Color.gray
     var onColor = Color.yellow
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4)
    }
}

//
//  PriceView.swift
//  Pizza_Time
//
//  Created by Matthew Zahar on 4/17/20.
//  Copyright © 2020 mzahar. All rights reserved.
//

import SwiftUI

struct PriceView: View {
    @Binding var price: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "dollarsign.square")

    var offColor = Color.gray
    var onColor = Color.green
    
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.price ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.price = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        if number > price {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
    

}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(price: .constant(3))
    }
}

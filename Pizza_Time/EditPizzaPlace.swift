//
//  EditPizzaPlace.swift
//  Pizza_Time
//
//  Created by Matthew Zahar on 4/22/20.
//  Copyright © 2020 mzahar. All rights reserved.
//

import SwiftUI

struct EditPizzaPlace: View {
    @ObservedObject var pizzaPlace: PizzaPlace
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var cities = ["Burlington", "South Burlington", "Winooski", "Essex"]

    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Name of restaurant", text: $pizzaPlace.name)
                    
                    Picker("City", selection: $pizzaPlace.city)
                    {
                        ForEach(cities, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    PriceView(price: $pizzaPlace.price)
                    RatingView(rating: $pizzaPlace.rating)
                    TextField("Review", text: $pizzaPlace.review)
                    
                    if self.image.count != 0 {
                        Image(uiImage: UIImage(data: self.image)!)
                            .resizable()
                            .scaledToFit()
                    } else {
                        Button(action: {
                            self.showingImagePicker = true
                        }) {
                            Image(systemName: "photo.fill")
                        }
                    }
                }
                
                Section {
                    Button("Save") {
                        try self.moc.save()
                    }
                }
            }.navigationBarTitle(Text("Edit Pizza Place"))
        }
    }
}

struct EditPizzaPlace_Previews: PreviewProvider {
    static var previews: some View {
        AddPizzaPlace()
    }
}

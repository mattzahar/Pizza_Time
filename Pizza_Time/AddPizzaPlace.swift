//
//  AddPizzaPlace.swift
//  Pizza_Time
//
//  Created by Matthew Zahar on 4/17/20.
//  Copyright © 2020 mzahar. All rights reserved.
//

import SwiftUI

struct AddPizzaPlace: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var city = ""
    @State private var price = 2
    @State private var rating = 3
    @State private var review = ""
    
    var cities = ["Burlington", "South Burlington", "Winooski", "Essex"]

    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("Name of restaurant", text: $name)
                    
                    Picker("City", selection: $city) {
                        ForEach(cities, id: \.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    PriceView(price: $price)
                    RatingView(rating: $rating)
                    TextField("Review", text: $review)
                }
                
                Section {
                    Button("Save") {
                        let newPlace = PizzaPlace(context: self.moc)
                        newPlace.id = UUID()
                        newPlace.name = self.name
                        newPlace.city = self.city
                        newPlace.rating = Int16(self.rating)
                        newPlace.price = Int16(self.price)
                        newPlace.review = self.review

                        do {
                            try self.moc.save()
                        } catch {
                            print(error)
                        }
                        self.presentationMode.wrappedValue.dismiss()
                    }
                } 
            }.navigationBarTitle(Text("New Pizza"))
        }
    }
}

struct AddPizzaPlace_Previews: PreviewProvider {
    static var previews: some View {
        AddPizzaPlace()
    }
}

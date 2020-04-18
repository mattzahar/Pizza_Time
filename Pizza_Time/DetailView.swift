//
//  DetailView.swift
//  Pizza_Time
//
//  Created by Matthew Zahar on 4/17/20.
//  Copyright © 2020 mzahar. All rights reserved.
//

import CoreData
import SwiftUI
import CoreLocation

struct DetailView: View {
    let pizzaPlace: PizzaPlace
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                ZStack(alignment: .bottomTrailing) {
                    MapView(coordinate: getCoords(city: self.pizzaPlace.city ?? "Burlington"))
                                    .edgesIgnoringSafeArea(.top)
                                    .frame(height: 300)
                    Text(self.pizzaPlace.city?.uppercased() ?? "BURLINGTON")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .clipShape(Capsule())
                        .offset(x: -5, y: -5)
                }
                RatingView(rating: .constant(Int(self.pizzaPlace.rating)))
                    .font(.largeTitle)
                    .padding()
                PriceView(price: .constant(Int(self.pizzaPlace.price)))
                .font(.largeTitle)
                Text(self.pizzaPlace.review ?? "No Review")
                    .padding()
            }
        }
        .navigationBarTitle(Text(pizzaPlace.name ?? "Unknown Name"), displayMode: .inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let pizzaPlace = PizzaPlace(context: moc)
        pizzaPlace.name = "Marcos"
        pizzaPlace.city = "Burlington"
        pizzaPlace.price = 3
        pizzaPlace.rating = 5
        pizzaPlace.review = "Some great pizza from these guys"
        return NavigationView{
            DetailView(pizzaPlace: pizzaPlace)
        }
        
    }
}

func getCoords(city: String) -> CLLocationCoordinate2D{
    switch  city{
    case "Burlington":
        return CLLocationCoordinate2D(latitude:44.475990, longitude: -73.210999)
    case "South Burlington":
        return CLLocationCoordinate2D(latitude:44.475990, longitude: -73.210999)
    case "Winooski":
        return CLLocationCoordinate2D(latitude:44.475990, longitude: -73.210999)
    case "Essex":
        return CLLocationCoordinate2D(latitude:44.475990, longitude: -73.210999)
    default :
        return CLLocationCoordinate2D(latitude:44.475990, longitude: -73.210999)
    }
}

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
    @Environment(\.managedObjectContext) var moc
    @State private var image : Data = .init(count: 0)
    
    var body: some View {
        NavigationView {
            VStack{
                MapView(coordinate: getCoords(city: self.pizzaPlace.city ?? "Burlington"))
                                    .edgesIgnoringSafeArea(.top)
                                    .frame(height: 300)

                    
                Image(uiImage: (UIImage(data: self.pizzaPlace.imageD!)!))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 12)
                        .offset(x: 0, y: -130)
                        .padding(.bottom, -130)
                
                    VStack(alignment: .center) {
                        RatingView(rating: .constant(Int(self.pizzaPlace.rating)))
                            .font(.largeTitle)
                            .padding()
                        PriceView(price: .constant(Int(self.pizzaPlace.price)))
                        .font(.largeTitle)
                        
                
                    }.navigationBarTitle(Text(pizzaPlace.name ?? "Unknown Name").font(.largeTitle), displayMode: .inline)
                        
                
                Text(self.pizzaPlace.review ?? "No Review")
                    
                    .multilineTextAlignment(.leading)
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)

            }
        }
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
        return CLLocationCoordinate2D(latitude:44.454040, longitude: -73.178900)
    case "Winooski":
        return CLLocationCoordinate2D(latitude:44.489648, longitude: -73.187087)
    case "Essex":
        return CLLocationCoordinate2D(latitude:44.490138, longitude: -73.114598)
    default :
        return CLLocationCoordinate2D(latitude:44.475990, longitude: -73.210999)
    }
}

//
//  DetailView.swift
//  Pizza_Time
//
//  Created by Matthew Zahar on 4/17/20.
//  Copyright © 2020 mzahar. All rights reserved.
//

import CoreData
import SwiftUI

struct DetailView: View {
    let pizzaPlace: PizzaPlace
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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

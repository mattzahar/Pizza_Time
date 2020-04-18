//
//  ContentView.swift
//  Pizza_Time
//
//  Created by Matthew Zahar on 4/17/20.
//  Copyright © 2020 mzahar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: PizzaPlace.entity(), sortDescriptors: [])
    var places: FetchedResults<PizzaPlace>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(places, id: \.self) { place in
                    NavigationLink(destination: Text(place.name ?? "Unknown Name")) {
                        EmojiView(rating: place.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(place.name ?? "Unknown Name")
                                .font(.headline)
                            Text(place.city ?? "Unknown City")
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationBarTitle("Pizza Places")
            .navigationBarItems(trailing:
                Button(action: {
                    self.showingAddScreen.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $showingAddScreen){
                    AddPizzaPlace().environment(\.managedObjectContext, self.moc)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

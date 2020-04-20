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
    @FetchRequest(entity: PizzaPlace.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \PizzaPlace.rating, ascending: true),
    ])
    var places: FetchedResults<PizzaPlace>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(places, id: \.self) { place in
                    NavigationLink(destination: DetailView(pizzaPlace: place)) {
                        EmojiView(rating: place.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(place.name ?? "Unknown Name")
                                .font(.headline)
                            Text(place.city ?? "Unknown City")
                                .foregroundColor(.secondary)
                        }
                    }
                }.onDelete{ IndexSet in
                    let deleteItem = self.places[IndexSet.first ?? 0]
                    self.moc.delete(deleteItem)
                    
                    do{
                        try self.moc.save()
                    } catch {
                        print(error)
                    }
                }
                .onMove(perform: move)
                
            }
            .navigationBarTitle("Pizza Places")
            .navigationBarItems(
                leading: EditButton(),trailing:
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
        func move(indexSet: IndexSet, destination: Int) {
            
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



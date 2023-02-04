//
//  ContentView.swift
//  TanksCoreData
//
//  Created by Sergei Poluboiarinov on 02.02.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(countries, id: \.self) { country in
                    Section (content: {
                        ForEach(country.tankArray, id: \.self) { tank in
                            NavigationLink {
                                EditTankView(tank: tank)
                            } label: {
                                Text(tank.wrappedTankName)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                Button(role: .destructive) {
                                    DataController().deleteTank(tank: tank, context: moc)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }

                            }
                        }
                    }, header: {
                        Text(country.wrappedCountry)
                            .font(.callout)
                            .foregroundColor(.secondary)
                            .fontWeight(.bold)
                    })
                }
            }
            .navigationTitle("World of Tanks")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        AddTankView()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

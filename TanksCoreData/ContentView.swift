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
                    Section(country.wrappedCountry) {
                        ForEach(country.tankArray, id: \.self) { tank in
                            NavigationLink {
                                AddTankView()
                            } label: {
                                Text(tank.wrappedTankName)
                            }
                        }
                    }
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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

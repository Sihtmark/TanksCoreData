//
//  ContentView.swift
//  TanksCoreData
//
//  Created by Sergei Poluboiarinov on 02.02.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.countries) { country in
                    Section("\(country.countryName!)") {
                        ForEach(country.tankArray) { tank in
                            NavigationLink {
                                EditTankView(tank: $tank)
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

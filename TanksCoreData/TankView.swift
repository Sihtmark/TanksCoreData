//
//  TankView.swift
//  TanksCoreData
//
//  Created by Sergei Poluboiarinov on 02.02.2023.
//

import SwiftUI

struct TankView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    var tank: FetchedResults<Tank>.Element
    
    @State private var tankName = ""
    @State private var tankType = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("\(tank.tankName!)", text: $tankName)
            Menu {
                Button {
                    tankType = "Light tank"
                } label: {
                    Text("Light tank")
                }
                Button {
                    tankType = "Medium tank"
                } label: {
                    Text("Medium tank")
                }
                Button {
                    tankType = "Heavy tank"
                } label: {
                    Text("Heavy tank")
                }
                Button {
                    tankType = "Tank destroyer"
                } label: {
                    Text("Tank destroyer")
                }
                Button {
                    tankType = "Artily"
                } label: {
                    Text("Artily")
                }
            } label: {
                ZStack {
                    Capsule()
                        .foregroundColor(.gray)
                        .frame(height: 37)
                    Text(tankType)
                        .font(.system(size: 18))
                }
            }
            
        }
    }
}

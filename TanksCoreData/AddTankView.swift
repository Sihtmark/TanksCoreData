//
//  AddTankView.swift
//  TanksCoreData
//
//  Created by Sergei Poluboiarinov on 02.02.2023.
//

import SwiftUI

struct AddTankView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var tankName = ""
    @State private var tankType = "Light tank"
    @State private var tankOrigin  = "Germany"
    @State private var tankRank = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Tank name", text: $tankName)
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
                ZStack(alignment: .leading) {
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width: 150,height: 37)
                    Text(tankType)
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .padding(.leading, 10)
                }
            }
            Menu {
                Button {
                    tankOrigin = "USSR"
                } label: {
                    Text("USSR")
                }
                Button {
                    tankOrigin = "Germany"
                } label: {
                    Text("Germany")
                }
                Button {
                    tankOrigin = "France"
                } label: {
                    Text("France")
                }
                Button {
                    tankOrigin = "United Kingdom"
                } label: {
                    Text("United Kingdom")
                }
                Button {
                    tankOrigin = "USA"
                } label: {
                    Text("USA")
                }
            } label: {
                ZStack(alignment: .leading) {
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width: 150,height: 37)
                    Text(tankOrigin)
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .padding(.leading, 10)
                }
            }
            Picker(selection: $tankOrigin, label: Text("Picker")) {
                Button {
                    tankOrigin = "USA"
                } label: {
                    Text("USA")
                }
                Button {
                    tankOrigin = "France"
                } label: {
                    Text("USA")
                }
                Button {
                    tankOrigin = "USA"
                } label: {
                    Text("USA")
                }
                Button {
                    tankOrigin = "USA"
                } label: {
                    Text("USA")
                }
                Button {
                    tankOrigin = "USA"
                } label: {
                    Text("USA")
                }
                
                Text("USSR")
                Text("France")
                Text("Germany")
                Text("Great Britain")
            }
        }
        .padding()
    }
}

struct AddTankView_Previews: PreviewProvider {
    static var previews: some View {
        AddTankView()
    }
}

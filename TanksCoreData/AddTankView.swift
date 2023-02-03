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
    
    @State private var tankName   = ""
    @State private var tankType   = "Light tank"
    @State private var tankOrigin = "Germany"
    @State private var tankRank: Int   = 1
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Tank name", text: $tankName)
            Picker(selection: $tankType, label: Text("Picker")) {
                Text("Light tank").tag("Light tank")
                Text("Medium tank").tag("Medium tank")
                Text("Heavy tank").tag("Heavy tank")
                Text("Tank destroyer").tag("Tank destroyer")
                Text("Artily").tag("Artily")
            }
            Picker(selection: $tankOrigin, label: Text("Picker")) {
                Text("USA").tag("USA")
                Text("Germany").tag("Germany")
                Text("France").tag("France")
                Text("Great Britain").tag("Great Britain")
                Text("USA").tag("USA")
            }
            Picker(selection: $tankRank, label: Text("Picker")) {
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
                Text("6").tag(6)
                Text("7").tag(7)
                Text("8").tag(8)
                Text("9").tag(9)
                Text("10").tag(10)
            }
            Button {
                let int16: Int16 = Int16(tankRank)
                DataController().addTank(name: tankName, type: tankType, rank: int16, origin: tankOrigin, context: moc)
                dismiss()
            } label: {
                Text("Save")
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

//
//  ParametersView.swift
//  CityTale
//
//  Created by Salvatore Capuozzo on 14/09/22.
//

import SwiftUI

struct ParametersView: View {
    
    @State private var selectedTime: Time = ._30
    @State private var selectedPrice: Price = ._0
    @State var nextPressed: Bool = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.username, ascending: true)],
        animation: .default)
    private var items: FetchedResults<User>
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Picker("Time", selection: $selectedTime) {
                        Text("Up to 30 minutes").tag(Time._30)
                        Text("Up to 1 hour").tag(Time._60)
                        Text("Up to 1 hour and a half").tag(Time._90)
                        Text("Up to 2 hours").tag(Time._120)
                        Text("Up to 2 hours and a half").tag(Time._150)
                        Text("Up to 3 hours").tag(Time._180)
                        Text("More than 3 hours").tag(Time._more)
                    }
                    
                    Picker("Price", selection: $selectedPrice) {
                        Text("Free").tag(Price._0)
                        Text("Up to 5€").tag(Price._5)
                        Text("Up to 10€").tag(Price._10)
                        Text("Up to 20€").tag(Price._20)
                        Text("Up to 50€").tag(Price._50)
                        Text("Up to 100€").tag(Price._100)
                        Text("More than 100€").tag(Price._more)
                    }
                }
                Button {
                    NavigationLink(destination: Text("End"), label: {})
                } label: {
                    Text("Next")
                }
            }
            
        }
    }
}

struct ParametersView_Previews: PreviewProvider {
    static var previews: some View {
        ParametersView()
    }
}

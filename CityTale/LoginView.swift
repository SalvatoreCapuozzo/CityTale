//
//  LoginView.swift
//  CityTale
//
//  Created by Salvatore Capuozzo on 13/09/22.
//

import SwiftUI

struct LoginView: View {
    @State var usernameText: String = ""
    @State var emailText: String = ""
    @Binding var loginPressed: Bool
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.username, ascending: true)],
        animation: .default)
    private var items: FetchedResults<User>
    
    var body: some View {
        NavigationView{
            Form {
                Section {
                    TextField("username", text: $usernameText)
                    TextField("email", text: $emailText)
                        .keyboardType(.emailAddress)
                }
                
                Section{
                    Button {
                        self.loginPressed.toggle()
                    } label: {
                        Text("Accedi")
                    }
                }
            }.navigationTitle("Parlaci di te")
                .padding(.bottom,16)
        }
    
        .onChange(of: loginPressed) { newValue in
            if newValue {
                UserDefaults.standard.set(emailText, forKey: "loggedEmail")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(loginPressed: .constant(false))
    }
}

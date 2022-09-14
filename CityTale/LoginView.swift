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
    @State var loginPressed: Bool = false
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \User.username, ascending: true)],
        animation: .default)
    private var items: FetchedResults<User>
    
    var body: some View {
        VStack {
            Text("Welcome to CityTale!")
            TextField("username", text: $usernameText)
            TextField("email", text: $emailText)
            Button {
                self.loginPressed.toggle()
            } label: {
                Text("Accedi")
            }
        }
        .padding(.horizontal, 16)
        .onChange(of: loginPressed) { newValue in
            if newValue {
                UserDefaults.standard.set(emailText, forKey: "loggedEmail")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

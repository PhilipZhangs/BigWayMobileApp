//
//  LoginView.swift
//  BigWayMobileApp
//
//  Created by 张胖子 on 2024-08-20.
//

import SwiftUI

let burgundy = Color(red: 174/255, green: 36/255, blue: 49/255)
let green = Color(red: 115/255, green: 206/255, blue: 171/255, opacity: 1.0)

// Hardcoded credentials for demonstration
let validUsername = "User"
let validPassword = "Pass"

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showingAlert: Bool = false
    @State private var isLoggedIn: Bool = false // Track login status

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150) // Adjust the size as needed
                    .padding(.bottom, 20)
                
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
            
                Button(action: {
                    login()
                }) {
                    Text("Login")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
            }
            .padding()
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeView()
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Invalid Login"), message: Text("Please check your username and password"), dismissButton: .default(Text("OK")))
            }
        }
    }

    func login() {
        // Check the entered credentials against the hardcoded valid credentials
        if username == validUsername && password == validPassword {
            isLoggedIn = true // Navigate to HomeView if the credentials are correct
        } else {
            showingAlert = true // Show an alert if the credentials are incorrect
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

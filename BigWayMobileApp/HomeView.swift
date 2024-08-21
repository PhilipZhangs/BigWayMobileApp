//
//  HomeView.swift
//  BigWayMobileApp
//
//  Created by 张胖子 on 2024-08-21.
//

import SwiftUI

struct HomeView: View {
    @State private var name: String = ""
    @State private var partySize: String = ""
    @State private var waitlistNumber: Int? = nil
    @State private var isSubmitted: Bool = false
    
    var body: some View {
        VStack {
            Text("Join the Waitlist")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("Enter party size", text: $partySize)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .padding(.bottom)
            
            Button(action: {
                isSubmitted = true
                waitlistNumber = Int.random(in: 1...100)
            }) {
                Text("Submit")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
            
            if isSubmitted, let waitlistNumber = waitlistNumber {
                Text("Thank you, \(name)!")
                    .font(.title)
                    .padding(.top)
                
                Text("Your waitlist number is \(waitlistNumber).")
                    .font(.title2)
                    .padding(.top, 2)
            }

            Spacer()
        }
    }
}

struct WaitlistView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

//
//  RegistrationView.swift
//  SwiftUIDemos
//
//  Created by mukesh on 25/05/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
    
    // MARK: - Propertiers
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView{
        VStack() {
            Text("Sign In")
                .font(.largeTitle).foregroundColor(Color.white)
                .padding([.top, .bottom], 20)
                .shadow(radius: 10.0, x: 20, y: 0)
            
            Image("image_compo")
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10.0, x: 20, y: 10)
                .padding(.bottom, 25)
            
            VStack(alignment: .leading, spacing: 15) {
                TextField("Email", text: self.$email)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
                
                SecureField("Password", text: self.$password)
                    .padding()
                    .background(Color.themeTextField)
                    .cornerRadius(20.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding([.leading, .trailing], 27.5)
            
            Button(action: {}) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15.0)
                    .shadow(radius: 10.0, x: 20, y: 10)
            }.padding(.top, 50)
            
            Spacer()
            HStack(spacing: 0) {
                Text("Don't have an account? ")
                Button(action: {}) {
                    Text("Sign Up")
                        .foregroundColor(.black)
                }
            }
        }.onTapGesture {
            self.endEditing(true)
        }
            
        .background(
            LinearGradient(gradient: Gradient(colors: [.red, .purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
        }.onTapGesture {
            self.endEditing(true)
        }
        
    }
}

extension View {
    func endEditing(_ force: Bool) {
        UIApplication.shared.windows.forEach { $0.endEditing(force)}
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

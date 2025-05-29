//
//  SignInView.swift
//  ChatApp
//
//  Created by 박채영 on 5/28/25.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var authViewModel: AuthViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        TextField("email", text: $email)
        TextField("password", text: $password)
        
        AuthButton(title: "로그인") {
            authViewModel.signIn(email: email, password: password)
        }
        .padding()
    }
}

#Preview {
    SignInView(authViewModel: AuthViewModel())
}

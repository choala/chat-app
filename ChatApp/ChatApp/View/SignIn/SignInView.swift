//
//  SignInView.swift
//  ChatApp
//
//  Created by 박채영 on 5/28/25.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        TextField("email", text: $email)
        TextField("password", text: $password)
    }
}

#Preview {
    SignInView()
}

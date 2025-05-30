//
//  SignInView.swift
//  ChatApp
//
//  Created by 박채영 on 5/28/25.
//

import SwiftUI

struct SignInView: View {
    /// Auth 뷰 모델 변수
    @EnvironmentObject var authViewModel: AuthViewModel
    /// 이메일 입력을 위한 변수
    @State private var email: String = ""
    /// 패스워드 입력을 위한 변수
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("email", text: $email)
                TextField("password", text: $password)
                
                AuthButton(title: "로그인") {
                    Task {
                        await authViewModel.signIn(email: email, password: password)
                    }
                }
            }
            .padding()
            .navigationDestination(isPresented: $authViewModel.isLoggedIn) {
                MainView()
            }
        }
    }
}

#Preview {
    SignInView()
}

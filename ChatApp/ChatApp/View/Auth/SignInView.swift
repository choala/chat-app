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
    /// 이메일 입력을 위한 @State 변수
    @State private var email: String = ""
    /// 패스워드 입력을 위한 @State 변수
    @State private var password: String = ""
    /// 회원가입 뷰로 전환을 위한 @State 변수
    @State private var isSignUpClicked: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("email", text: $email)
                TextField("password", text: $password)
                
                AuthButton(title: "로그인") {
                    authViewModel.signIn(email: email, password: password)
                }
                
                AuthButton(title: "회원가입") {
                    isSignUpClicked = true
                }
            }
            .padding()
            .navigationDestination(isPresented: $authViewModel.isLoggedIn) {
                MainTabView()
            }
            .navigationDestination(isPresented: $isSignUpClicked) {
                SignUpView()
            }
        }
    }
}

#Preview {
    SignInView()
        .environmentObject(AuthViewModel())
}

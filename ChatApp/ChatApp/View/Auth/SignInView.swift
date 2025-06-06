//
//  SignInView.swift
//  ChatApp
//
//  Created by 박채영 on 5/28/25.
//

import SwiftUI

/// 로그인 뷰
struct SignInView: View {
    // MARK: - Properties
    /// Auth 뷰 모델 변수
    @EnvironmentObject var authViewModel: AuthViewModel
    /// 이메일 입력을 위한 @State 변수
    @State private var email: String = ""
    /// 패스워드 입력을 위한 @State 변수
    @State private var password: String = ""
    /// 회원가입 뷰 전환을 위한 @State 변수
    @State private var isSignUpClicked: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(Color.backgroundColor)
                .ignoresSafeArea()
            
            NavigationStack {
                VStack {
                    TextField("email", text: $email)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(AuthTextFieldStyle())
                    
                    SecureField("password", text: $password)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(AuthTextFieldStyle())
                        .padding(.bottom, 30)
                    
                    AuthButton(title: "로그인") {
                        Task {
                            await authViewModel.signIn(
                                email: email,
                                password: password
                            )
                        }
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
}

#Preview {
    SignInView()
        .environmentObject(AuthViewModel())
}

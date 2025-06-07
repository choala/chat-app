//
//  SignUpView.swift
//  ChatApp
//
//  Created by 박채영 on 5/28/25.
//

import SwiftUI

/// 회원가입 뷰
struct SignUpView: View {
    // MARK: - Properties
    /// Auth 뷰 모델 변수
    @EnvironmentObject var authViewModel: AuthViewModel
    /// 사용자 닉네임 입력을 위한 @State 변수
    @State private var nickname: String = ""
    /// 이메일 입력을 위한 @State 변수
    @State private var email: String = ""
    /// 패스워드 입력을 위한 @State 변수
    @State private var password: String = ""
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(Color.backgroundColor)
                .ignoresSafeArea()
            
            NavigationStack {
                VStack(alignment: .leading) {
                    // TODO: 닉네임, 이메일 중복 확인
                    Text("닉네임")
                        .font(.subheadline)
                    TextField("nickname", text: $nickname)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(AuthTextFieldStyle())
                        .padding(.bottom, 30)
                    
                    Text("이메일")
                        .font(.subheadline)
                    TextField("email", text: $email)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(AuthTextFieldStyle())
                        .padding(.bottom, 30)
                    
                    // TODO: 비밀번호 숨김 해제 버튼 추가
                    Text("비밀번호")
                        .font(.subheadline)
                    SecureField("password", text: $password)
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(AuthTextFieldStyle())
                    
                    Spacer()
                    
                    AuthButton(title: "회원가입") {
                        Task {
                            await authViewModel.signUp(
                                email: email,
                                password: password,
                                nickname: nickname
                            )
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    SignUpView()
}

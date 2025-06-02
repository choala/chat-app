//
//  SettingView.swift
//  ChatApp
//
//  Created by 박채영 on 1/15/25.
//

import SwiftUI

struct SettingView: View {
    /// Auth 뷰 모델 변수
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        AuthButton(title: "로그아웃") {
            authViewModel.signOut()
        }
    }
}

#Preview {
    SettingView()
}

//
//  FollowListView.swift
//  ChatApp
//
//  Created by 박채영 on 1/15/25.
//

import SwiftUI

/// 팔로우 리스트 뷰
struct FollowListView: View {
    // MARK: - Properties
    /// Auth 뷰 모델 변수
    @EnvironmentObject var authViewModel: AuthViewModel
    
    // MARK: - Body
    var body: some View {
        List {
            Text(authViewModel.user?.nickname ?? "Hi")
        }
    }
}

#Preview {
    FollowListView()
}

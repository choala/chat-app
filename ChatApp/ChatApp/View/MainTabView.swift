//
//  MainTabView.swift
//  ChatApp
//
//  Created by 박채영 on 1/15/25.
//

import SwiftUI

/// 친구 목록, 채팅 목록, 설정으로 이동하는 메인 탭 뷰
struct MainTabView: View {
    // MARK: - Properties
    /// Auth 뷰 모델 변수
    @EnvironmentObject var authViewModel: AuthViewModel
    
    // MARK: - Body
    var body: some View {
        TabView {
            Tab("Friend", systemImage: "person") {
                FriendListView()
            }
            
            Tab("Chat", systemImage: "bubble") {
                ChatRoomView()
            }
            
            Tab("Setting", systemImage: "gearshape") {
                SettingView()
            }
        }
    }
}

#Preview {
    MainTabView()
}

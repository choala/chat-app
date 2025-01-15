//
//  MainView.swift
//  ChatApp
//
//  Created by 박채영 on 1/15/25.
//

import SwiftUI

struct MainView: View {
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
    MainView()
}

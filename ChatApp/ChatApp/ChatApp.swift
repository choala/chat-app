//
//  ChatApp.swift
//  ChatApp
//
//  Created by 박채영 on 1/12/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Firebase 서비스 사용을 위한 초기화
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct ChatApp: App {
    // UIKit의 AppDelegate 연동
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var authViewModel: AuthViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            // 로그인 상태에 따라 분기
            if authViewModel.isLoggedIn {
                MainView()
                    .environmentObject(authViewModel)
            } else {
                SignInView()
                    .environmentObject(authViewModel)
            }
        }
    }
}

//
//  AuthViewModel.swift
//  ChatApp
//
//  Created by 박채영 on 5/28/25.
//

import FirebaseAuth

/// Auth 관련 처리를 위한 ViewModel
class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    var handle: AuthStateDidChangeListenerHandle?
    
    init() {
        self.isLoggedIn = Auth.auth().currentUser != nil
        // 로그인 상태가 변경될 때마다 호출
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            self.isLoggedIn = user != nil
        }
    }
    
    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    /// 회원가입 처리 함수
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
        }
    }
    
    /// 로그인 처리 함수
    func signIn(email: String, password: String) {
        if !email.isEmpty && !password.isEmpty {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                // ...
            }
        }
    }
    
    /// 로그아웃 처리 함수
    func signOut() {
        do {
            let result = try Auth.auth().signOut()
        } catch {
            
        }
    }
}

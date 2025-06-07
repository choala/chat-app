//
//  AuthViewModel.swift
//  ChatApp
//
//  Created by 박채영 on 5/28/25.
//

import FirebaseAuth
import FirebaseFirestore

/// Auth 관련 처리를 위한 ViewModel
class AuthViewModel: ObservableObject {
    // MARK: - Properties
    /// 로그인 여부를 나타내는 @Published 변수
    @Published var isLoggedIn: Bool = false
    /// 사용자 정보 DTO @Published 변수
    @Published var user: User?
    /// Auth 상태 변화 리스너를 처리하기 위한 변수
    var handle: AuthStateDidChangeListenerHandle?
    /// Firestore 참조 변수
    let firestore = Firestore.firestore()
    
    init() {
        self.isLoggedIn = Auth.auth().currentUser != nil
        // 로그인 상태가 변경될 때마다 호출
        handle = Auth.auth().addStateDidChangeListener { auth, user in
            self.isLoggedIn = user != nil
            
            if let user = user {
                Task {
                    await self.fetchUser(uid: user.uid)
                }
            }
        }
    }
    
    deinit {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    // MARK: - Methods
    /// 회원가입 처리 함수
    func signUp(email: String, password: String, nickname: String) async {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let userDTO = User(uid: authResult.user.uid, nickname: nickname)
            
            try await firestore.collection("users").document(authResult.user.uid).setData(from: userDTO)
            await fetchUser(uid: authResult.user.uid)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    /// 로그인 처리 함수
    func signIn(email: String, password: String) async {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            
            await fetchUser(uid: authResult.user.uid)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    /// 로그아웃 처리 함수
    func signOut() {
        do {
            let _: () = try Auth.auth().signOut()
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    /// 유저 정보 패치 함수
    func fetchUser(uid: String) async {
        print("fetchUser 실행")
        let docRef = firestore.collection("users").document(uid)
        
        do {
            let fetchedUser = try await docRef.getDocument(as: User.self)
            await MainActor.run {
                self.user = fetchedUser
                print(user?.nickname)
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

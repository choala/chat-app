//
//  AuthButton.swift
//  ChatApp
//
//  Created by 박채영 on 5/28/25.
//

import SwiftUI

struct AuthButton: View {
    let title: String
    
    var body: some View {
        Button {
            print(title)
        } label: {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.black)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    AuthButton(title: "로그인")
}

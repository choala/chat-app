//
//  AuthButton.swift
//  ChatApp
//
//  Created by 박채영 on 5/28/25.
//

import SwiftUI

/// Auth 관련 뷰에서 사용되는 공통 버튼
struct AuthButton: View {
    let title: String
    let action: () -> Void
    
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

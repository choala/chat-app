//
//  AuthTextFieldStyle.swift
//  ChatApp
//
//  Created by 박채영 on 6/2/25.
//

import SwiftUI

/// Auth 관련 TextField에서 사용되는 공통 스타일
struct AuthTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .stroke(Color.systemGray, lineWidth: 1)
                .frame(maxHeight: 55)
                .background(Color.clear)
            configuration
                .padding()
        }
    }
}

//
//  AuthTextFieldStyle.swift
//  ChatApp
//
//  Created by 박채영 on 6/2/25.
//

import SwiftUI

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

//
//  BubbleView.swift
//  ChatApp
//
//  Created by 박채영 on 1/15/25.
//

import SwiftUI

struct BubbleView: View {
    let message: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.yellow)
                .frame(width: 100, height: 30)
                .padding()
            Text("\(message)")
        }
    }
}

#Preview {
    BubbleView(message: "안녕하세요")
}

//
//  ChatRoomView.swift
//  ChatApp
//
//  Created by 박채영 on 1/12/25.
//

import SwiftUI

struct ChatRoomView: View {
    @State private var inputBubble: String = ""
    @State private var bubbles: [String] = []
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(bubbles, id: \.self) { bubble in
                    Text(bubble)
                }
            }
            
            HStack {
                TextField("메시지를 입력하세요.", text: $inputBubble)
                Button {
                    bubbles.append(inputBubble)
                    inputBubble = ""
                } label: {
                    Text("전송")
                }

            }
        }
        .padding()
    }
}

#Preview {
    ChatRoomView()
}

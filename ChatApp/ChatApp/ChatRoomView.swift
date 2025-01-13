//
//  ChatRoomView.swift
//  ChatApp
//
//  Created by 박채영 on 1/12/25.
//

import SwiftUI

struct ChatRoomView: View {
    @State private var inputBubble: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                Text("")
            }
            
            HStack {
                TextField("메시지를 입력하세요.", text: $inputBubble)
                Button {
                    print("Hi")
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

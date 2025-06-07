//
//  ChatListView.swift
//  ChatApp
//
//  Created by 박채영 on 1/12/25.
//

import SwiftUI

struct ChatListView: View {
    @State private var inputMessage: String = ""
    @State private var messages: [String] = []
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(messages, id: \.self) { message in
                    BubbleView(message: message)
                }
            }
            
            HStack {
                TextField("메시지를 입력하세요.", text: $inputMessage)
                Button {
                    messages.append(inputMessage)
                    inputMessage = ""
                } label: {
                    Text("전송")
                }

            }
        }
        .padding()
    }
}

#Preview {
    ChatListView()
}

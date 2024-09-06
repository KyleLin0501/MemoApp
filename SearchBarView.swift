//
//  SearchBarView.swift
//  MemoApp
//
//  Created by 林楷祐 on 2024/9/5.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String

    @State private var isEditing = false

    var body: some View {
        HStack {

            TextField("輸入要搜索的內容 ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)

                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .background(RoundedRectangle(cornerRadius: 10).stroke(.gray,lineWidth: 2))
                .background(Color.white)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""

                }) {
                    Text("Cancel")
                        .foregroundStyle(Color.black)
                }
                
            }
        }
        
        .padding(10)
    }
}

#Preview {
    SearchBarView(text: .constant(""))
}

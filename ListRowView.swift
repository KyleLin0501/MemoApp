//
//  ListRowView.swift
//  MemoApp
//
//  Created by 林楷祐 on 2024/9/5.
//

import SwiftUI

struct ListRowView: View {
    let item : ItemModel
    var body: some View {
        NavigationLink {
            AddView(addingTitle: item.title, addingContent: item.content, editingItemId: item.id)
        } label: {
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title2)
                Text(item.content)
                    .lineLimit(1)
                    .font(.system(size: 14))
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListRowView(item: ItemModel(title: "123", content: "1234"))
        ListRowView(item: ItemModel(title: "123", content: "1234"))
    }
   
}

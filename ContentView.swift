//
//  ContentView.swift
//  MemoApp
//
//  Created by 林楷祐 on 2024/9/5.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State var search: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("備忘錄")
                        .font(.system(size: 40))
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                
                SearchBarView(text: $search)
                
                List {
                    ForEach(listViewModel.item.filter({ search.isEmpty ? true : $0.title.contains(search) })) { item in
                        ListRowView(item: item)
                    }
                    .onDelete(perform: listViewModel.removeItems)
                    .onMove(perform: listViewModel.moveItems)
                }
                .scrollContentBackground(.hidden)
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink("Add") {
                        AddView()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        ContentView()
    }
    .environmentObject(ListViewModel())
}

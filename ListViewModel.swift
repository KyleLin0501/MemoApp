//
//  ListViewModel.swift
//  MemoApp
//
//  Created by 林楷祐 on 2024/9/5.
//

import SwiftUI
class ListViewModel : ObservableObject {
    @Published var item:[ItemModel] = []
    init(){
        getItems()
    }
    func getItems(){
        let data=[
            ItemModel(title: "123",content: "123"),
        ]
        item.append(contentsOf: data)
    }
    func removeItems(offsets:IndexSet){
        item.remove(atOffsets: offsets)
    }
    func moveItems(from:IndexSet ,to:Int){
        item.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title : String, content: String){
        let newItem = ItemModel(title: title, content: content)
        item.append(newItem)
    }
    func updateItem(by id: String, newTitle: String, newContent: String) {
        if let index = item.firstIndex(where: { $0.id == id }) {
            // 找到對應的項目後更新其屬性
            item[index].title = newTitle
            item[index].content = newContent
        } else {
            print("Item with id \(id) not found")
        }
    }
}

//
//  ItemModel.swift
//  MemoApp
//
//  Created by 林楷祐 on 2024/9/5.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    var title : String
    var content: String
}

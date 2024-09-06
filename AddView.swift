//
//  AddView.swift
//  MemoApp
//
//  Created by 林楷祐 on 2024/9/5.
//
import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var listViewModel : ListViewModel
    @State var addingTitle : String = ""
    @State var addingContent : String = ""
    @State var editingItemId: String? = nil

    var body: some View {
        ZStack {
            VStack {
                TextField("請輸入標題", text: $addingTitle)
                    .padding()
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)

                ZStack(alignment: .topLeading) {
                    TextEditor(text: $addingContent)
                        .font(.callout)

                    if addingContent.isEmpty {
                        Text("請輸入內容")
                            .foregroundStyle(Color(UIColor.placeholderText))
                            .padding(8)
                    }
                }
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 2)
                }

                Button {
                    saveButtonPressed()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("儲存")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.8))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }

    func saveButtonPressed() {
        if let editingItemId = editingItemId {
            for item in listViewModel.item {
                if editingItemId == item.id {
                    listViewModel.updateItem(by: editingItemId, newTitle: addingTitle, newContent: addingContent)
                    break
                }
            }
        } else {
            listViewModel.addItem(title: addingTitle, content: addingContent)
        }
        editingItemId = nil
    }

}



#Preview {
    AddView()
}

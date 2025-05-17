//
//  ContentView.swift
//  Country List
//
//

import SwiftUI
import SwiftData

//struct ContentView: View {
////    @Environment(\.modelContext) private var modelContext
////    @Query private var items: [Item]
//
//    var body: some View {
//        NavigationSplitView {
//            List {
//                ForEach(viewModel.list, id: \.name) { item in
//                    NavigationLink {
//                        Text("Item at \(item.name)")
//                    } label: {
//                        Text(item.name ?? "")
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                if !viewModel.items.isEmpty {
//                    ToolbarItem(placement: .navigationBarTrailing) {
//                        EditButton()
//                    }
//                }
//               
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        } detail: {
//            Text("Select an item")
//        }
//        .onAppear(){
//            viewModel.callApi()
//        }
//    }
//
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            viewModel.modelContext.insert(newItem)
//        }
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                viewModel.modelContext.delete(viewModel.items[index])
//            }
//        }
//    }
//}

//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}

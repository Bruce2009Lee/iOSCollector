//
//  SimpleBookworm.swift
//  iOSCollector
//
//  Created by lizhonglian on 2020/12/20.
//

import SwiftUI

struct SimpleBookworm: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: true)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddScreen = false
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // 在我们的获取请求中找到这本书
            let book = books[offset]

            // 从上下文中删除它
            moc.delete(book)
        }

        // 保存上下文
        try? moc.save()
    }
    
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)

                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown Title")
                                .font(.headline)
                            Text(book.author ?? "Unknown Author")
                                .foregroundColor(.secondary)
                        }
                    }
                }.onDelete(perform: deleteBooks)
            }.navigationBarTitle("Bookworm")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showingAddScreen.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddScreen) {
                AddBookView().environment(\.managedObjectContext, self.moc)
            }
        }
    }
}

struct SimpleBookworm_Previews: PreviewProvider {
    static var previews: some View {
        SimpleBookworm()
    }
}

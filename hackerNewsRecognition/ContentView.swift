//
//  ContentView.swift
//  hackerNewsRecognition
//
//  Created by Franco Marquez on 4/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var hnFeed = HNStoriesFeed()
    
    var body: some View {
        
        NavigationStack{
            
            List(hnFeed.storyItems){ articleItem in
                
                NavigationLink(destination:
                                LazyView(CommentView(commentIds: articleItem.kids ?? [])))
                {
                    
                    StoryListItemView(article: articleItem)
                    
                }
                
            }
            .navigationBarTitle("Hacker News Stories")
            
        }
    }
}

struct LazyView<Content: View>:View{
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content{
        build()
    }
}

struct StoryListItemView: View {
    var article: StoryItem
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("\(article.title ?? "")")
                .font(.headline)
            Text("Author: \(article.by)")
                .font(.subheadline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

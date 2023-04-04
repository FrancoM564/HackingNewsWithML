//
//  CommentView.swift
//  hackerNewsRecognition
//
//  Created by Franco Marquez on 4/04/23.
//

import Foundation
import SwiftUI


struct CommentView : View{
    
    @ObservedObject var commentFeed = HNCommentFeed()
    
    var body: some View {
    
        List(commentFeed.comments){ item in
    
            
            Text(item.sentimentScore)
                .background(((item.sentimentScore as NSString).floatValue >= 0.0) ? Color.green : Color.red)
                .frame(alignment: .trailing)
            
            Text(item.text ?? "")
            
        }
        .navigationBarTitle("Comment Score \(commentFeed.sentimentAvg)")
        .navigationBarItems(trailing: (((commentFeed.sentimentAvg as NSString).floatValue >= 0.0) ? Image(systemName: "smiley.fill").foregroundColor(Color.green) : Image(systemName: "smiley.fill").foregroundColor(Color.red)))
    }

    init(commentIds: [Int]) {
        commentFeed.getIds(ids: commentIds)
    }
}

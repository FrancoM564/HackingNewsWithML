//
//  FetchItem.swift
//  hackerNewsRecognition
//
//  Created by Franco Marquez on 4/04/23.
//

import Foundation
import Combine

struct FetchItem: Publisher{
    
    typealias Output = StoryItem
    typealias Failure = Error
    
    let id : Int
    
    func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
            let request = URLRequest(url: URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json")!)
            URLSession.DataTaskPublisher(request: request, session: URLSession.shared)
                .map { $0.0 }
                .decode(type: StoryItem.self, decoder: JSONDecoder())
                .receive(subscriber: subscriber)
        }
    
}

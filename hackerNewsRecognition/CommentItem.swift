//
//  CommentItem.swift
//  hackerNewsRecognition
//
//  Created by Franco Marquez on 4/04/23.
//

import Foundation

struct CommentItem : Identifiable, Codable {
    
    let id: Int
    var text: String?
    var sentimentScore : String = ""

    private enum CodingKeys: String, CodingKey {
            case id, text
        }
}

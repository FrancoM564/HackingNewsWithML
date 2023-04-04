//
//  StructItem.swift
//  hackerNewsRecognition
//
//  Created by Franco Marquez on 4/04/23.
//

import Foundation

struct StoryItem : Identifiable, Codable {
    let by: String
    let id: Int
    let kids: [Int]?
    let title: String?
private enum CodingKeys: String, CodingKey {
            case by, id, kids, title
        }
}

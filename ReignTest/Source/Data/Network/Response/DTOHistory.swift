//
//  HistoryDTO.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import UIKit

struct DTOHistory {
    var author: String?
    var commentText: String?
    var createdAtI: Int?
    var storyTitle: String?
    var storyUrl: String?
    var title: String?
}

extension DTOHistory: Codable {
    enum CodingsKey: String, CodingKey {
        case author
        case commentText = "comment_text"
        case createdAtI = "created_at_i"
        case storyTitle = "story_title"
        case storyUrl = "story_url"
        case title
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingsKey.self)
        author = try container.decodeIfPresent(String.self, forKey: .author)
        commentText = try container.decodeIfPresent(String.self, forKey: .commentText)
        createdAtI = try container.decodeIfPresent(Int.self, forKey: .createdAtI)
        storyTitle = try container.decodeIfPresent(String.self, forKey: .storyTitle)
        storyUrl = try container.decodeIfPresent(String.self, forKey: .storyUrl)
        title = try container.decodeIfPresent(String.self, forKey: .title)
    }
}

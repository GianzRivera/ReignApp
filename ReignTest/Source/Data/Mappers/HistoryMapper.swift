//
//  HistoryMapper.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import Foundation

class HistoryMapper {
    func fromDTO(dto: DTOHistory) -> History {
        var history = History()
        history.author = dto.author
        history.commentText = dto.commentText
        history.createdAtI = dto.createdAtI
        history.storyTitle = dto.storyTitle
        history.storyUrl = dto.storyUrl
        history.title = dto.title
        return history
    }
    
    func fromCoreData(cdHistory: CDHistory) -> History {
        var history = History()
        history.author = cdHistory.author
        history.commentText = cdHistory.commentText
        history.createdAtI = Int(cdHistory.createdAtI)
        history.storyTitle = cdHistory.storyTitle
        history.storyUrl = cdHistory.storyUrl
        history.title = cdHistory.title
        return history
    }
    
    func toCoreData(history: History, intoCoreDataObject cdHistory: CDHistory) {
        cdHistory.author = history.author
        cdHistory.commentText = history.commentText
        cdHistory.createdAtI = Int64(history.createdAtI ?? 0)
        cdHistory.storyTitle = history.storyTitle
        cdHistory.storyUrl = history.storyUrl
        cdHistory.title = history.title
        return
    }
}

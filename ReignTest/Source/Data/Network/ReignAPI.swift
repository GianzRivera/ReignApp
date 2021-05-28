//
//  ReignAPI.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import Moya

enum ReignAPI {
    case getHistorys
}

extension ReignAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://hn.algolia.com/")!
    }
    //https://hn.algolia.com/api/v1/search_by_date?query=mobile
    var path: String {
        switch self {
        case .getHistorys:
            return "api/v1/search_by_date"
        }
    }
    
    var method: Method {
        switch self {
        case .getHistorys:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getHistorys:
            return .requestParameters(parameters: ["query": "mobile"],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}

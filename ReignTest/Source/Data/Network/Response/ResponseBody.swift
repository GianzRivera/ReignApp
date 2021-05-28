//
//  ResponseBody.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//

import Foundation

class ResponseBody<Payload: Decodable>: Decodable {
    var success: Bool?
    var data: Payload?
    var error: String?
    
    enum ResponseBodyCodingsKey: String, CodingKey {
        case success
        case data
        case error
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseBodyCodingsKey.self)
        
        success = try container.decode(Bool.self, forKey: .success)
        data = try container.decode(Payload.self, forKey: .data)
        // error = try container.decode(String.self, forKey: .error)
    }
}

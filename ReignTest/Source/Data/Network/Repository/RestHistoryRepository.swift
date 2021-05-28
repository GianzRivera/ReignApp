//
//  RestHistoryRepository.swift
//  ReignTest
//
//  Created by Gianz Rivera on 25/05/21.
//


import Moya
import RxSwift

class RestHistoryRepository: HistoryRepository {
    private let provider = MoyaProvider<ReignAPI>(plugins: [NetworkLoggerPlugin()])
    
    func listAll() -> Single<[History]> {
        let mapper = HistoryMapper()
        return provider.rx
            .request(.getHistorys)
            .map(GetHitsResponse.self)
            .map { responseBody -> [History]  in
                return responseBody.hits.map { mapper.fromDTO(dto: $0) }
        }
    }
    
}


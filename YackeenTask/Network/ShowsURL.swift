//
//  ShowsURL.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
}

public typealias Parameters = [String: String]

enum Router {
    
    case showsList(_ queryParam: String)
    
    var BASE_URL: String {
        return "http://api.tvmaze.com/"
    }
    
    var url: String {
        return BASE_URL + "search/shows"
    }
    
    
    var method: HttpMethod {
        return .get
    }
    
    var parameter: Parameters? {
        switch self {
        case .showsList(let quary):
            return ["q": quary]
        }
    }
    
    func asURLRequest() -> URLRequest {
        var components = URLComponents(string: url)!
        components.queryItems = parameter?.enumerated().map {
            URLQueryItem(name: $1.key, value: $1.value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)
        return request
    }
}

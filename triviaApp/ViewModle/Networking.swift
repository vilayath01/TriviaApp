//
//  Networking.swift
//  triviaApp
//
//  Created by vila on 23/1/2024.
//

import Foundation
import Combine


class NetworkingManager {
    
    
    private let trueOrFalseApiUrl = URL(string: "https://opentdb.com/api.php?amount=10&category=9&difficulty=easy&type=boolean")!
    
    func fetchResponse() -> AnyPublisher<TrueOrFalseResponse, Error> {
        URLSession.shared.dataTaskPublisher(for: trueOrFalseApiUrl)
            .map(\.data)
            .decode(type: TrueOrFalseResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    
    
}

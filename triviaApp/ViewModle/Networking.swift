
import Foundation
import Combine
import SwiftUI


class NetworkingManager {
    
    @Published var trueOrFalseResponse = TrueOrFalseResponse(results: [])
    
    var cancellable: Set<AnyCancellable> = []
    
    func getPosts(amt:String, catego: String, diff: String, typ: String) {
        let urlString = "https://opentdb.com/api.php?amount=\(amt)&category=\(catego)&difficulty=\(diff)&type=\(typ)"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard
                    let response = response as? HTTPURLResponse,
                    response.statusCode >= 200 else {
                    return response as? NSError as! Data
                }
                return data
            }
            .decode(type: TrueOrFalseResponse.self, decoder: JSONDecoder())
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("this is error from combine: \(error)")
                }
            } receiveValue: { trueOrFalseResponse in
                print("correctAnswer: \(trueOrFalseResponse.results[0].inCorrectAnswer)")
            }
            .store(in: &cancellable)
    }
}

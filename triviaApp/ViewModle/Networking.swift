
import Foundation
import Combine

class NetworkingManager: ObservableObject {
    var passthroughSubject = PassthroughSubject<TrueOrFalseResponse, Never>()
    var cancellables = Set<AnyCancellable>()
    
    func getPosts(amt:String, catego: String, diff: String, typ: String)  {
        let urlString = "https://opentdb.com/api.php?amount=\(amt)&category=\(catego)&difficulty=\(diff)&type=\(typ)"
           guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .map { $0.data }
            .decode(type: TrueOrFalseResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    self.passthroughSubject.send(completion: .failure(error as! Never))
                case .finished:
                    break
                }
            }, receiveValue: { data in
                self.passthroughSubject.send(data)
                self.passthroughSubject.send(completion: .finished)
            })
            
            .store(in: &cancellables)
    }
}

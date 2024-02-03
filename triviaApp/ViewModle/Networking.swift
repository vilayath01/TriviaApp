
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
//                    self.passthroughSubject.send(completion: .failure(error as! Never))
                    print("this is from netwrokingManager error: \(error)")
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



//class GenericNetworking: ObservableObject {
//    var cancellables = Set<AnyCancellable>()
//    var passthroughSubject = PassthroughSubject<Any, Never>()
//    
//    func fetchData<T: Decodable>(from url: URL, responseType: T.Type) {
//        URLSession.shared.dataTaskPublisher(for: url)
//            .receive(on: DispatchQueue.main)
//            .map { $0.data }
//            .decode(type: responseType, decoder: JSONDecoder())
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .failure(let error):
//                    print("Error: \(error)")
//                case .finished:
//                    break
//                }
//            }, receiveValue: { data in
//                // Handle received data
//                print("Received data: \(data)")
//                self.passthroughSubject.send(data)
//            })
//            .store(in: &cancellables)
//    }
//}


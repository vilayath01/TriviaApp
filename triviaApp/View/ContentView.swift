
import SwiftUI
import Combine

struct ContentView: View {
    @State var cancellable: Set<AnyCancellable> = []
    let networkingManager = NetworkingManager()
    @State var selectedButtonText1: String = "Tap to choose"
    @State var selectedButtonText2: String = "Tap to choose"
    @State var selectedButtonText3: String = "Tap to choose"
    @State var selectedButtonText4: String = "Tap to choose"
    
    var body: some View {
        
        VStack {
            listOfSelection(selectedButtonText1: self.$selectedButtonText1, selectedButtonText2: self.$selectedButtonText2, selectedButtonText3: self.$selectedButtonText3, selectedButtonText4: self.$selectedButtonText4)
            SaveButton(tapSave: {
                networkingManager.fetchResponse()
                    .sink { completion in
                        switch completion {
                        case .finished:
                            break
                        case .failure(let error):
                            print("this is error from combine: \(error)")
                        }
                    } receiveValue: { trueOrFalseResponse in
                        
                        print("correctAnswer: \(trueOrFalseResponse.results[7].correctAnswer)")
                        
                    }
                    .store(in: &cancellable)

            })
                .padding(.top, 50)
        }
        .padding()
        
    }
    
    func updateText()  {
       
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedButtonText1:"Tap to choose" , selectedButtonText2: "Tap to choose", selectedButtonText3: "Tap to choose", selectedButtonText4: "Tap to choose")
    }
}

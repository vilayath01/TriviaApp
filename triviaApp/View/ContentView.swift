
import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                listOfSelection(amt: $viewModel.selectedAmt, catego: $viewModel.selectedCatego, diff: $viewModel.selectedDiff, typ: $viewModel.seletedTyp)
                SaveButton(tapSave: {
                    
                    
                    viewModel.fetchQuizData()
                    
                })
                .padding(.top, 50)
                
                NavigationLink(destination:  PlayScreen(viewModel: viewModel), isActive: $viewModel.isActive) {
           
                    Text("Let's Go!")
                }
                .disabled(viewModel.quizData.isEmpty)
                .onReceive(viewModel.networkingManager.passthroughSubject) { value in
                    self.viewModel.updateQuizData(with: value.results)
                  
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

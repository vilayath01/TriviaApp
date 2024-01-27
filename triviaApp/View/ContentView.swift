
import SwiftUI
import Combine

struct ContentView: View {
    
    var categoriesList = CategoriesList()
    let networkingManager = NetworkingManager()
    @State var selectedAmt: String = "Tap to Choose"
    @State var selectedCatego: String = "Tap to Choose"
    @State var selectedDiff: String = "Tap to Choose"
    @State var seletedTyp: String = "Tap to Choose"
    @State var isActive: Bool = false
    @State var whichScreen: String = ""

    var body: some View {
        NavigationView {
            VStack {
                listOfSelection(amt: self.$selectedAmt, catego: self.$selectedCatego, diff: self.$selectedDiff, typ: self.$seletedTyp)
                SaveButton(tapSave: {
                  
                   let valueOfCatego = categoriesList.getAssociatedValue( categoryName: self.selectedCatego, difficultyName: self.selectedDiff, typeName: self.seletedTyp)
                    networkingManager.getPosts(amt: self.selectedAmt, catego: valueOfCatego.0 ?? "", diff: valueOfCatego.1 ?? "", typ: valueOfCatego.2 ?? "")
                    whichScreen = valueOfCatego.2 ?? ""
                    isActive = true
                    
      
                    
                })
                    .padding(.top, 50)
                NavigationLink(destination:  PlayScreen(showView1: whichScreen), isActive: $isActive) {
                    Text("Let's Go!")
                }
            }
            .padding()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

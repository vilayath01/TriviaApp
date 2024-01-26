
import SwiftUI
import Combine

struct ContentView: View {
    
    var categoriesList = CategoriesList()
    let networkingManager = NetworkingManager()
    @State var selectedAmt: String = "Tap to Choose"
    @State var selectedCatego: String = "Tap to Choose"
    @State var selectedDiff: String = "Tap to Choose"
    @State var seletedTyp: String = "Tap to Choose"

    var body: some View {
        
        VStack {
            listOfSelection(amt: self.$selectedAmt, catego: self.$selectedCatego, diff: self.$selectedDiff, typ: self.$seletedTyp)
            SaveButton(tapSave: {
                networkingManager.getPosts(amt: self.selectedAmt, catego: self.selectedCatego, diff: self.selectedDiff, typ: self.seletedTyp)
                let valueOfCatego = categoriesList.getAssociatedValue( categoryName: self.selectedCatego, difficultyName: self.selectedDiff, typeName: self.seletedTyp)
                print("This is value of catego \(valueOfCatego)")
            })
                .padding(.top, 50)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

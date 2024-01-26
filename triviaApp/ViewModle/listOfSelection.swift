
import SwiftUI

struct listOfSelection: View {
   @Binding var amt: String
   @Binding var catego: String
   @Binding var diff: String
   @Binding var typ: String
    var numberArray: [String] {
        return (1...50).map {String($0)}
    }
    
    var categoriesList = CategoriesList()
    
    var body: some View {
        
        VStack {
            
            
            RoundedGradientButton(buttonText: self.$amt, categories: numberArray, labelText: "Number of Questions:")
            RoundedGradientButton(buttonText: self.$catego, categories: Array(categoriesList.nameValueMappingCategory.keys) , labelText: "Select Category:")
            RoundedGradientButton(buttonText: self.$diff, categories:  Array(categoriesList.nameValueMappingDifficulty.keys) , labelText: "Select Difficulty:")
            RoundedGradientButton(buttonText: self.$typ, categories: Array(categoriesList.nameValueMappingType.keys) , labelText: "Select Type:")
        }
    }
}

#Preview {
    listOfSelection(amt: .constant(""), catego: .constant(""), diff: .constant(""), typ: .constant(""))
}

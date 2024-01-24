
import SwiftUI

struct listOfSelection: View {
    @Binding  var selectedButtonText1: String
    @Binding var selectedButtonText2: String
    @Binding var selectedButtonText3: String
    @Binding var selectedButtonText4: String
    var numberArray: [String] {
        return (1...50).map {String($0)}
    }
    
    var body: some View {
        
        VStack {
            
            RoundedGradientButton(buttonText: self.$selectedButtonText1, categories: numberArray, labelText: "Number of Questions:")
            RoundedGradientButton(buttonText: self.$selectedButtonText2, categories: ["Vilayath","Junaid"], labelText: "Select Category:")
            RoundedGradientButton(buttonText: self.$selectedButtonText3, categories: ["Vilayath","Junaid"], labelText: "Select Difficulty:")
            RoundedGradientButton(buttonText: self.$selectedButtonText4, categories: ["Vilayath","Junaid"], labelText: "Select Type:")
        }
    }
}

#Preview {
    listOfSelection(selectedButtonText1: .constant(""), selectedButtonText2: .constant(""), selectedButtonText3: .constant(""), selectedButtonText4: .constant(""))
}

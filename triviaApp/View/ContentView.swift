//
//  ContentView.swift
//  triviaApp
//
//  Created by vila on 22/1/2024.
//

import SwiftUI

struct ContentView: View {
    @State var selectedButtonText1: String = "Tap to choose"
    @State var selectedButtonText2: String = "Tap to choose"
    @State var selectedButtonText3: String = "Tap to choose"
    @State var selectedButtonText4: String = "Tap to choose"
    
    var body: some View {
        
        VStack {
            listOfSelection(selectedButtonText1: self.$selectedButtonText1, selectedButtonText2: self.$selectedButtonText2, selectedButtonText3: self.$selectedButtonText3, selectedButtonText4: self.$selectedButtonText4)
            SaveButton(tapSave: {
                print("Item1:\(self.selectedButtonText1),Item2:\(self.selectedButtonText2),Item3:\(self.selectedButtonText3), Item3:\(self.selectedButtonText4)")
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

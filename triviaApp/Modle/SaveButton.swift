//
//  SaveButton.swift
//  triviaApp
//
//  Created by vila on 23/1/2024.
//

import SwiftUI

struct SaveButton: View {
    
    var tapSave: ()-> Void
    var body: some View {
        Button {
            
            tapSave()
        } label: {
            Text("Save")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(minWidth: 0, maxWidth: 100)
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(10)
                .padding(.horizontal, 20)
        }
        
    }
}

#Preview {
    SaveButton(tapSave: {
        
    })
}

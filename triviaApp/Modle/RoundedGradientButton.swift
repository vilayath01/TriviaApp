//
//  Button.swift
//  triviaApp
//
//  Created by vila on 22/1/2024.
//

import SwiftUI

struct RoundedGradientButton: View {
    @Binding var buttonText: String
    var categories: [String]
    var labelText: String
    
    var body: some View {
        VStack {
            
            Label(labelText, systemImage: "")
                .padding(.leading, -150)
                .bold()
            Menu {
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        
                        buttonText = category
                    }) {
                        Text(category)
                    }
                }
            } label: {
                Text(buttonText)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(minWidth: 0, maxWidth: 300)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
        }
        .padding(.top)
    }
}

#Preview {
    
    RoundedGradientButton(buttonText: .constant("tap me"), categories: ["Vila", "Junnu"], labelText: "Select Category:")
}






//
//  CommonButton.swift
//  triviaApp
//
//  Created by vila on 27/1/2024.
//

import SwiftUI

import SwiftUI

struct CommonButton: View {
    var buttonText: String
    var action: () -> Void
    var buttonInsidePadding: CGFloat

    var body: some View {
        Button(action: action) {
            Text(buttonText)
                .bold()
                .padding(.horizontal,buttonInsidePadding)
                .padding()
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.brown)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.white, lineWidth: 2)
                        )
                )
                .frame(width: 180)
            
        }
    }
}

struct ReusableButton_Previews: PreviewProvider {
    static var previews: some View {
        CommonButton(buttonText: "true", action: {
            ""
        }, buttonInsidePadding: 30)
    }
}


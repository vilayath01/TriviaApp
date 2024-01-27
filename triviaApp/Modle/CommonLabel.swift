import SwiftUI

struct CommonLabel: View {
    var labelText: String

    var body: some View {
        Text(labelText)
            .font(.headline)
            .bold()
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke( lineWidth: 3)
                    )
            )
//            .frame(width: 350)
    }
        
}

struct CommonLabel_Previews: PreviewProvider {
    static var previews: some View {
        CommonLabel(labelText: "Hello, SwiftUI!  ")
            .padding()
    }
}


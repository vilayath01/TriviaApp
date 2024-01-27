
import SwiftUI

struct PlayScreen: View {
    @State var showView1: String = "boolean"
    
    var body: some View {
        
        if showView1 == "boolean" {
            VStack {
                HStack {
                    CommonLabel(labelText: "Q: 2/5")
                        .padding(.trailing, 80)
                    CommonLabel(labelText: "Score: 100")
                }
                
                .padding(.top, -120)
                .padding(.bottom, 30)
                
                CommonLabel(labelText: "This is an sample multiple chooice label to display on the screen before implemention of actual lable!")
                
                    .padding(.bottom, 40)
                
                HStack {
                    CommonButton(buttonText: " True ", action: {
                        print("Got True printed")
                    }, buttonInsidePadding: 35)
                    .padding()
                    CommonButton(buttonText: " False ", action: {
                        print("Got False printed")
                    }, buttonInsidePadding: 35)
                }
            }
            .padding(.leading, 25)
            .padding(.trailing, 25)
        }
        
        if showView1 == "multiple" {
            VStack{
                HStack {
                    CommonLabel(labelText: "Q: 2/5")
                        .padding(.trailing, 80)
                    CommonLabel(labelText: "Score: 100")
                }
                
                .padding(.top, -120)
                .padding(.bottom, 30)
                
                CommonLabel(labelText: "This is an sample multiple chooice label to display on the screen before implemention of actual lable!")
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                    .padding(.bottom, 40)
                
                VStack {
                    HStack {
                        CommonButton(buttonText: " This is going to hit ", action: {
                            print("Got True printed")
                        }, buttonInsidePadding: 0)
                        
                        CommonButton(buttonText: " This is going to fall ", action: {
                            print("Got True printed")
                        }, buttonInsidePadding: 0)
                        
                    }
                    .padding()
                    HStack {
                        CommonButton(buttonText: " This is going to hit ", action: {
                            print("Got True printed")
                        }, buttonInsidePadding: 0)
                        
                        CommonButton(buttonText: " This is going to fall ", action: {
                            print("Got True printed")
                        }, buttonInsidePadding: 0)
                    }
                }
            }
            .padding(.leading, 25)
            .padding(.trailing, 25)
            
        }
        
    }
    
}

#Preview {
    PlayScreen(showView1: "boolean")
}




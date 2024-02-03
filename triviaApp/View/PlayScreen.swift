
import SwiftUI
import Combine

struct PlayScreen: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        HStack {
            CommonLabel(labelText: "Q: \(viewModel.currentIndex + 1)/\(viewModel.quizData.count)")
                .padding(.trailing, 80)
            CommonLabel(labelText: "Score: \(viewModel.scoreCount)")
        }
        
        .padding(.top, -120)
        .padding(.bottom, 30)
        
        VStack {
            
            if viewModel.whichScreen == "boolean" {
                
                CommonLabel(labelText: viewModel.quizData[viewModel.currentIndex].question)
                
                    .padding(.bottom, 40)
                
                HStack {
                    CommonButton(buttonText: " True ", action: {
                        
                        print("this is current index \(viewModel.currentIndex)")
                        if viewModel.quizData[viewModel.currentIndex].correctAnswer == "True" {
                            viewModel.getScore()
                            viewModel.getCurrentIndex()
                        }else {
                            print("this is correct Answer \(viewModel.quizData[viewModel.currentIndex].correctAnswer)")
                            viewModel.getCurrentIndex()
                        }
                    }, buttonInsidePadding: 35)
                    .padding()
                    CommonButton(buttonText: " False ", action: {
                        
                        print("the answer is correct")
                        if viewModel.quizData[viewModel.currentIndex].correctAnswer == "False" {
                            viewModel.getScore()
                            viewModel.getCurrentIndex()
                        }else {
                            print("this is correct Answer \(viewModel.quizData[viewModel.currentIndex].correctAnswer)")
                            viewModel.getCurrentIndex()
                        }
                    }, buttonInsidePadding: 35)
                }
            }
            
        }
        .padding(.leading, 25)
        .padding(.trailing, 25)
        
        if viewModel.whichScreen == "multiple" {
            VStack{
                
                CommonLabel(labelText: viewModel.quizData[viewModel.currentIndex].question)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                    .padding(.bottom, 40)
                
                VStack {
                        CommonButton(buttonText: viewModel.allQA[0], action: {
                            if viewModel.quizData[viewModel.currentIndex].correctAnswer == viewModel.allQA[0] {
                                viewModel.getScore()
                                viewModel.getCurrentIndex()
                                viewModel.updateMCQs()
                                print("the answer is correct")
                            }else {
                                print("this is correct Answer \(viewModel.quizData[viewModel.currentIndex].correctAnswer)")
                                viewModel.getCurrentIndex()
                                viewModel.updateMCQs()
                            }
                            
                        }, buttonInsidePadding: 0)
                        .padding()
                        
                        CommonButton(buttonText: viewModel.allQA[1] , action: {
                            
                            if viewModel.quizData[viewModel.currentIndex].correctAnswer == viewModel.allQA[1] {
                                viewModel.getScore()
                                viewModel.getCurrentIndex()
                                viewModel.updateMCQs()
                                print("the answer is correct")
                            }else {
                                print("this is correct Answer \(viewModel.quizData[viewModel.currentIndex].correctAnswer)")
                                viewModel.getCurrentIndex()
                                viewModel.updateMCQs()
                            }
                            print("Got True printed")
                        }, buttonInsidePadding: 0)
                    
                    .onAppear(perform: {
                        viewModel.updateMCQs()
                    })
                    .padding()
            
                        CommonButton(buttonText: viewModel.allQA[2], action: {
                            
                            if viewModel.quizData[viewModel.currentIndex].correctAnswer == viewModel.allQA[2] {
                                viewModel.getScore()
                                viewModel.getCurrentIndex()
                                viewModel.updateMCQs()
                                print("the answer is correct")
                            }else {
                                print("this is correct Answer \(viewModel.quizData[viewModel.currentIndex].correctAnswer)")
                                viewModel.getCurrentIndex()
                                viewModel.updateMCQs()
                            }
                            print("Got True printed")
                        }, buttonInsidePadding: 0)
                        .padding()
                        
                        CommonButton(buttonText: viewModel.allQA[3], action: {
                            
                            
                            if viewModel.quizData[viewModel.currentIndex].correctAnswer == viewModel.allQA[3] {
                                viewModel.getScore()
                                viewModel.getCurrentIndex()
                                viewModel.updateMCQs()
                                print("the answer is correct")
                            }else {
                                print("this is correct Answer \(viewModel.quizData[viewModel.currentIndex].correctAnswer)")
                                viewModel.getCurrentIndex()
                                viewModel.updateMCQs()
                            }
                            print("Got True printed")
                        }, buttonInsidePadding: 0)
                    
                }
            }
            .padding(.leading, 25)
            .padding(.trailing, 25)
        }
    }
}


struct PlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        PlayScreen()
    }
}




import SwiftUI
import Combine

struct PlayScreen: View {
    @State var showView1: String = "boolean"
    @State var quizQuestion: String = ""
    @State var correctAnswer: String = ""
    @State var incorrectAnswer: [String] = [""]
    @State var selectedAns: String = ""
    @State var quizData: [QuizResult] = []
    @State var currentIndex = 0
    @State var allQA: [String] = ["loading", "loading", "loading", "loading"]
    
    var body: some View {
        HStack {
            CommonLabel(labelText: "Q: \(currentIndex + 1)/\(quizData.count)")
                .padding(.trailing, 80)
            CommonLabel(labelText: "Score: 100")
        }
        
        .padding(.top, -120)
        .padding(.bottom, 30)
        
        VStack {
            
            if showView1 == "boolean" {
                
                CommonLabel(labelText: quizData[currentIndex].question)
                
                    .padding(.bottom, 40)
                
                HStack {
                    CommonButton(buttonText: " True ", action: {
                        currentIndex += 1
                        print("this is current index \(currentIndex)")
                        if quizData[currentIndex].correctAnswer == "True" {
                            
                        }
                    }, buttonInsidePadding: 35)
                    .padding()
                    CommonButton(buttonText: " False ", action: {
                        currentIndex += 1
                        print("the answer is correct")
                        if quizData[currentIndex].correctAnswer == "False" {
                            
                        }
                    }, buttonInsidePadding: 35)
                }
            }
            
        }
        .padding(.leading, 25)
        .padding(.trailing, 25)
        
        if showView1 == "multiple" {
            VStack{
                
                CommonLabel(labelText: quizData[currentIndex].question)
                    .padding(.leading, 25)
                    .padding(.trailing, 25)
                    .padding(.bottom, 40)
                
                VStack {
                    HStack {
                        CommonButton(buttonText: self.allQA[0], action: {
                            currentIndex += 1
                            updateMCQs()
                            if quizData[currentIndex].correctAnswer == quizData[currentIndex].correctAnswer {
                                
                                print("the answer is correct")
                            }
                            
                        }, buttonInsidePadding: 0)
                        
                        CommonButton(buttonText: self.allQA[1] , action: {
                            currentIndex += 1
                            updateMCQs()
                            if quizData[currentIndex].correctAnswer == quizData[currentIndex].correctAnswer {
                                
                                print("the answer is correct")
                            }
                            print("Got True printed")
                        }, buttonInsidePadding: 0)
                        
                    }
                    .padding()
                    HStack {
                        CommonButton(buttonText: self.allQA[2], action: {
                            currentIndex += 1
                            updateMCQs()
                            if quizData[currentIndex].correctAnswer == quizData[currentIndex].correctAnswer {
                                
                                print("the answer is correct")
                            }
                            print("Got True printed")
                        }, buttonInsidePadding: 0)
                        
                        CommonButton(buttonText: self.allQA[3], action: {
                            currentIndex += 1
                            updateMCQs()
                            if quizData[currentIndex].correctAnswer == quizData[currentIndex].correctAnswer {
                                
                                print("the answer is correct")
                            }
                            print("Got True printed")
                        }, buttonInsidePadding: 0)
                    }
                }
            }
            .padding(.leading, 25)
            .padding(.trailing, 25)
            .onAppear(perform: {
                
                updateMCQs()
                
                
            })
            
        }
        
    }
    func updateMCQs() {
        var getAllQA = [quizData[currentIndex].correctAnswer, quizData[currentIndex].inCorrectAnswer[0], quizData[currentIndex].inCorrectAnswer[1], quizData[currentIndex].inCorrectAnswer[2]]
        var suffeledQA = getAllQA.shuffled()
        
        self.allQA = suffeledQA
    }
}

#Preview {
    PlayScreen(showView1: "boolean")
}




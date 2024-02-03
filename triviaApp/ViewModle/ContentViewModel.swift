//
//  ContentViewViewModel.swift
//  triviaApp
//
//  Created by vila on 30/1/2024.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    
    @Published var selectedAmt: String = "Tap to Choose"
    @Published var selectedCatego: String = "Tap to Choose"
    @Published var selectedDiff: String = "Tap to Choose"
    @Published var seletedTyp: String = "Tap to Choose"
    
    @Published var isActive: Bool = false
    @Published var whichScreen: String = ""
    
    @Published var correctAnswer: String = ""
    @Published var incorrectAnswer: [String] = [""]
    
    @Published var quizData: [QuizResult] = []
    @Published var currentIndex = 0
    @Published var scoreCount = 0
    @Published var allQA: [String] = ["loading", "loading", "loading", "loading"]
    
    let categoriesList = CategoriesList()
    let networkingManager = NetworkingManager()
    
    func fetchQuizData() {
        let valueOfCatego = categoriesList.getAssociatedValue( categoryName: self.selectedCatego, difficultyName: self.selectedDiff, typeName: self.seletedTyp)
        networkingManager.getPosts(amt: self.selectedAmt, catego: valueOfCatego.0 ?? "", diff: valueOfCatego.1 ?? "", typ: valueOfCatego.2 ?? "")
        whichScreen = valueOfCatego.2 ?? ""
    }
    
    
    func getCurrentIndex() {
        self.currentIndex =  currentIndex + 1
    }
    
    func getScore() {
        self.scoreCount = scoreCount + 1
        
    }
    func updateMCQs() {
        let getAllQA = [quizData[currentIndex].correctAnswer, quizData[currentIndex].inCorrectAnswer[0], quizData[currentIndex].inCorrectAnswer[1], quizData[currentIndex].inCorrectAnswer[2]]
        var suffeledQA = getAllQA.shuffled()
        
        self.allQA = suffeledQA
    }
    
    func updateQuizData(with newData: [QuizResult]) {
        self.quizData = newData
        isActive = true
        
    }
}

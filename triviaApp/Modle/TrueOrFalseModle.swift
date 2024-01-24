//
//  ApiModle.swift
//  triviaApp
//
//  Created by vila on 22/1/2024.
//

import Foundation

struct TrueOrFalseResponse: Codable {
    
    let results: [QuizResult]
}
struct QuizResult: Codable {
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correctAnswer: String
    let inCorrectAnswer: [String]
    enum CodingKeys: String, CodingKey {
        case type
        case difficulty
        case category
        case question
        case correctAnswer = "correct_answer"
        case inCorrectAnswer = "incorrect_answers"
    }
}
   




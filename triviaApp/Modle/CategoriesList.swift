//
//  CategoriesList.swift
//  triviaApp
//
//  Created by vila on 25/1/2024.
//

import Foundation

struct CategoriesList {
    
    var nameValueMappingCategory: [String: String] = [
        "General Knowledge": "9",
        "Entertainment: Books": "10",
        "Entertainment: Film": "11",
        "Entertainment: Music": "12",
        "Entertainment: Musicals & Theatres": "13",
        "Entertainment: Television": "14",
        "Entertainment: Video Games": "15",
        "Entertainment: Board Games": "16",
        "Science & Nature": "17",
        "Science: Computers": "18",
        "EScience: Mathematics": "19",
        "Mythology": "20",
        "Sports": "21",
        "Geography": "22",
        "History": "23",
        "Politics": "24",
        "Art": "25",
        "Celebrities": "26",
        "Animals": "27",
        "Vehicles": "28",
        "Entertainment: Comics": "29",
        "Science: Gadgets": "30",
        "Entertainment: Japanese Anime & Manga": "31",
        "Entertainment: Cartoon & Animations": "32"
    ]
    
    var nameValueMappingDifficulty: [String: String] = [
    
        "Easy" : "easy",
        "Medium" : "medium",
        "Hard" : "hard"
    ]
    
    var nameValueMappingType: [String : String] = [
        "Multiple Choice" : "multiple",
        "True/False" : "boolean"
    ]
    
    func getAssociatedValue( categoryName: String, difficultyName: String, typeName: String) -> (String?, String?, String?) {
            let categoryValue = nameValueMappingCategory[categoryName] ?? ""
            let difficultyValue = nameValueMappingDifficulty[difficultyName] ?? ""
            let typeValue = nameValueMappingType[typeName] ?? ""
        return (categoryValue, difficultyValue, typeValue)
    }
}



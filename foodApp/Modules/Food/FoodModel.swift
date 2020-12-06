//
//  FoodModel.swift
//  foodApp
//
//  Created by Juan Camilo on 6/12/20.
//

import Foundation

struct Food: Codable {
    var meals: [Meals]
}

struct Meals: Codable {
    var idMeal: String
    var strMeal: String
    var strMealThumb: String
}



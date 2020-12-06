//
//  FoodConstants.swift
//  foodApp
//
//  Created by Juan Camilo on 6/12/20.
//

import Foundation

struct FoodConstants {
    static let baseUrl = Configuration.shared.getValueConfiguration(withType: String.self, key: .baseUrl)
    static let apiKeyPath = "api_key"
    
    struct General {
        static let customErrorMessages = "Failded data load"
    }
    
    struct URL {
        struct Paths {
            static let search = "search.php"
            static let foodDetail = "lookup.php"
            static let randomFood = "random.php"
        }
        
        struct QueryPath {
            static let search = "s"
            static let foodDetail = "i"
        }
    }
}

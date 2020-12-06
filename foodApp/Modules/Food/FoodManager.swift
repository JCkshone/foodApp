//
//  FoodManager.swift
//  foodApp
//
//  Created by Juan Camilo on 6/12/20.
//

import Foundation
import RxSwift
import RxCocoa

protocol IFoodManager: class {
    func search(valueToSearch: String) -> Observable<[Meals]>
}

class FoodManager: IFoodManager {
    func search(valueToSearch: String) -> Observable<[Meals]> {
        var queryParams = [URLQueryItem]()
        queryParams.append(URLQueryItem(name: FoodConstants.URL.QueryPath.search, value: valueToSearch))
        
        return Observable.create { observer in
            NetworkServices.share.get(type: Food.self, params: queryParams, aditionalPath: FoodConstants.URL.Paths.search) { response in
                switch response {
                  case .success(let data):
                    observer.onNext(data.meals)
                  case .failure(let error):
                      print(error.localizedDescription)
                  }
            }
            return Disposables.create()
        }
    }
}



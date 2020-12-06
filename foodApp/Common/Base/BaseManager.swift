//
//  BaseManager.swift
//  foodApp
//
//  Created by Juan Camilo on 6/12/20.
//

import Foundation
import RxSwift

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}

extension ErrorResult {
    var localizedDescription: String {
        switch self {
        case .network(let value): return value
        case .parser(let value):  return value
        case .custom(let value):  return value
        }
    }
}

protocol IBaseManager : class {
    var errorSubject: PublishSubject<ErrorResult> { get set }
}

class BaseManager : IBaseManager {
    var errorSubject: PublishSubject<ErrorResult> = PublishSubject()
    
    private func getGenericError () -> ErrorResult {
        ErrorResult.custom(string: FoodConstants.General.customErrorMessages)
    }
    
    func createResponse <T> (response: T?, error: String?, observer: AnyObserver<T>) {
        if let response = response {
            observer.onNext(response)
            observer.onCompleted()
            return
        }
        
        guard let error = error else {
            self.errorSubject.onNext(self.getGenericError())
            return
        }
        
        self.errorSubject.onNext(ErrorResult.network(string: error))
    }
}


//
//  BaseViewModel.swift
//  foodApp
//
//  Created by Juan Camilo on 6/12/20.
//

import RxSwift
import RxCocoa

struct Output <T> {
    let response: Driver<T>
    let errorMessage: Driver<String>
}

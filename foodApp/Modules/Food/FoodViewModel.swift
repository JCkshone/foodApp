//
//  FoodViewModel.swift
//  foodApp
//
//  Created by Juan Camilo on 6/12/20.
//

import Foundation
import RxSwift
import RxCocoa

protocol IFoodViewModel: class {
    var output : Output<[Meals]>! { get set }
    var input: InputFoodViewModel { get set }
}

struct InputFoodViewModel {
    var valueToSearch: BehaviorRelay<String>
}

class FoodViewModel: IFoodViewModel {
    var input: InputFoodViewModel
    var doSearch: BehaviorRelay<Void>
    var output: Output<[Meals]>!
    var manager: IFoodManager
    var disposeBag = DisposeBag()
    
    init(manager: IFoodManager = FoodManager()) {
        self.manager = manager
        self.doSearch = BehaviorRelay<Void>(value: ())
        self.input = InputFoodViewModel(valueToSearch: BehaviorRelay<String>(value: ""))
        createOutput(observer: doSearch)
    }
    
    func createOutput(observer: BehaviorRelay<Void>) {
        let prErrorRelay = PublishRelay<String>()
        let result = observer
            .flatMapLatest { (_) -> Observable<[Meals]> in self.manager.search(valueToSearch: self.input.valueToSearch.value ) }
            .asDriver { (err) -> Driver<[Meals]> in
                prErrorRelay.accept((err as? ErrorResult)?.localizedDescription ?? err.localizedDescription)
                return Driver.just([])
        }
        output = Output(response: result, errorMessage: prErrorRelay.asDriver(onErrorJustReturn: "An error happened"))
        
    }
    
    func setupEvents() {
        input.valueToSearch.asDriver().compactMap { search  in
            self.doSearch.accept(())
        }.drive().disposed(by: disposeBag)
    }
    
}

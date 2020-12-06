//
//  MainCoordinator.swift
//  NasaApp
//
//  Created by Juan Camilo on 6/12/20.
//  Copyright © 2020 Juan Camilo. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func search() {
        let vc = SearchFoodViewController()
        
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

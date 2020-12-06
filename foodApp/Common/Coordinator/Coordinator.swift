//
//  Coordinator.swift
//  NasaApp
//
//  Created by Juan Camilo on 6/12/20.
//  Copyright © 2020 Juan Camilo. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func search()
}

//
//  Coordinator Type.swift
//  PeopleApp
//
//  Created by Megha Uppin on 08/09/2022.
//

import Foundation
import UIKit

protocol CoordinatorType: AnyObject {
    var navController: UINavigationController { get set }
    func start()
}


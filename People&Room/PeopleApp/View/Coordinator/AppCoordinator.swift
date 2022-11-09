//
//  AppCoordinator.swift
//  PeopleApp
//
//  Created by Megha Uppin on 08/09/2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    func start()
    func navigateToPeople()
    func navigateToRooms()
    func navigateToPeopleDetails(peopleData: PeopleData)
}

final class AppCoordinator: Coordinator {
    private var navController: UINavigationController

    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func start() {
    }
       
    func navigateToPeople() {
        
        let networkManager = NetworkManager()
        let peopleVC = PeopleViewController()
        navController.pushViewController(peopleVC, animated: false)
        }
    
    func navigateToRooms() {
        
        let networkManager = NetworkManager()
        let roomsVC = RoomViewController()
        navController.pushViewController(roomsVC, animated: false)
    }
    
    func navigateToPeopleDetails(peopleData: PeopleData) {
    }

}

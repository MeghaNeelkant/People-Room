//
//  PeoplePage.swift
//  PeopleApp
//
//  Created by Megha Uppin on 09/11/2022.
//

import Foundation

struct PeoplePage: Decodable {
    let results: [results]
    
}

struct results: Decodable {
    let url: String
}




//
//  Room.swift
//  PeopleApp
//
//  Created by Megha Uppin on 09/11/2022.
//

import Foundation

struct RoomData: Decodable {
    var createdAt: String
    var isOccupied: Bool
    var maxOccupancy: Int
    var id: String
}

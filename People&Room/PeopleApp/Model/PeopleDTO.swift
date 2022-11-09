//
//  PeopleDTO.swift
//  PeopleApp
//
//  Created by Megha Uppin on 07/09/2022.
//

import Foundation


struct PeopleDTO: Decodable {
    
    var createdAt: String?
    var firstName: String?
    var avatar: String?
    var lastName: String?
    var email: String?
    var jobTitle: String?
    var favouriteColor: String?
    var id: String?
    
    enum CodingKeys: String, CodingKey{
        case createdAt,firstName,avatar,email,lastName,favouriteColor,id
        case jobTitle = "jobtitle"
    }
}



extension PeopleDTO {
    func toDomain() -> People {
        return People(firstName: firstName ?? "", avatar: avatar ?? "", lastName: lastName ?? "", email: email ?? "", jobTitle: jobTitle ?? "", joinedDate: createdAt ?? "")
    }
}


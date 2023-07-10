//
//  UniversityModel.swift
//  Final_Project
//
//  Created by Cullen Vaughan on 7/3/23.
//

import Foundation

struct UniversitiesResults : Codable {
    let resultsInfo : [UniversityModel]
}

struct UniversityModel : Codable, Identifiable {
    var id : UUID {
        return UUID()
    }
    let country : String
    let name : String
    let web_pages : [String]
}

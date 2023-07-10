//
//  CountryModel.swift
//  Final_Project
//
//  Created by Cullen Vaughan on 7/3/23.
//

import Foundation
import FirebaseFirestoreSwift

struct CountryModel : Codable, Identifiable {
    @DocumentID var id: String?
    var country: String
    var countryURL: String
}

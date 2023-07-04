//
//  CountryViewModel.swift
//  Final_Project
//
//  Created by Cullen Vaughan on 7/3/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class CountryViewModel : ObservableObject {
    
    @Published private(set) var countries = [CountryModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        self.countries.removeAll()
        db.collection("countries").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    do {
                        self.countries.append(try document.data(as: CountryModel.self))
                    } catch {
                        print(error)
                    }
                }
            }
        }
        
    }
}

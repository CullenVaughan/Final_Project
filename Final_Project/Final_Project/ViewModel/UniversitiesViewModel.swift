//
//  UniversitiesViewModel.swift
//  Final_Project
//
//  Created by Cullen Vaughan on 7/3/23.
//

import Foundation

class UniversitiesViewModel : ObservableObject {
    
    @Published private(set) var UniversitiesData = [UniversityModel]()
    private let url1 = "http://universities.hipolabs.com/search?country="
    
    func fetchData(countryURL: String) async {
        self.UniversitiesData.removeAll()
        let url = url1 + countryURL
        if let url = URL(string: url) {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let results = try JSONDecoder().decode([UniversityModel].self, from: data)
                self.UniversitiesData = results
            } catch {
                print(error)
            }
        }
    }
}

//
//  CountryDetail.swift
//  Final_Project
//
//  Created by Cullen Vaughan on 7/3/23.
//

import SwiftUI

struct CountryDetail: View {
    
    @ObservedObject var universitiesVM = UniversitiesViewModel()
    var country : CountryModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(universitiesVM.UniversitiesData) { university in
                    NavigationLink {
                        UniversityDetail()
                    } label: {
                        Text(university.name)
                    }
                }
            }
            .task {
                await universitiesVM.fetchData(countryURL: country.countryURL)
            }
            .listStyle(.grouped)
            .navigationTitle("Universities in " + country.country)
        }
    }
}

struct CountryDetail_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetail(country: CountryModel(country: "United States", countryURL: "United+States"))
    }
}

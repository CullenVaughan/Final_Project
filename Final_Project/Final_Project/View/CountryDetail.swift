//
//  CountryDetail.swift
//  Final_Project
//
//  Created by Cullen Vaughan on 7/3/23.
//

import SwiftUI

struct CountryDetail: View {
    
    @ObservedObject var universitiesVM = UniversitiesViewModel()
    @State var text : String = ""
    var country : CountryModel
    
    var body: some View {
        NavigationStack {
            List {
                Section { TextField("Search Universities in " + country.country, text: self.$text) }
                ForEach(universitiesVM.UniversitiesData) { university in
                    if (university.name.range(of: text) != nil || text == "") {
                        NavigationLink {
                            UniversityDetail(university: university)
                        } label: {
                            Text(university.name)
                        }
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

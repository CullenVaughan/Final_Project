//
//  ContentView.swift
//  Final_Project
//
//  Created by Cullen Vaughan on 7/3/23.
//

import SwiftUI

struct CountriesView: View {
    
    @StateObject var countriesVM = CountryViewModel()
    @State var text : String = ""
    
    var body: some View {
        NavigationStack {
            List {
                Section { TextField("Search Countries", text: self.$text) }
                ForEach(countriesVM.countries) { country in
                    if (country.country.range(of: text) != nil || text == "") {
                        NavigationLink {
                            CountryDetail(country: country)
                        } label: {
                            Text(country.country)
                        }
                    }
                }
            }
            .onAppear {
                countriesVM.fetchData()
            }
            .refreshable {
                countriesVM.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Countries")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CountriesView()
    }
}

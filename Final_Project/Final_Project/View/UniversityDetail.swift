//
//  UniversityDetail.swift
//  Final_Project
//
//  Created by Cullen Vaughan on 7/3/23.
//

import SwiftUI

struct UniversityDetail: View {
    
    @State private var showWebView = false
    var university : UniversityModel
    
    var body: some View {
        VStack {
            Text(university.country)
            Text(university.name)
            
            ForEach (university.web_pages, id: \.self) { webPage in
                Button {
                    showWebView.toggle()
                } label: {
                    Text(webPage)
                }
                .sheet(isPresented: $showWebView) {
                    WebView(url: URL(string: webPage)!)
                }
            }
        }
    }
}

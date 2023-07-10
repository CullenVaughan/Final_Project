//
//  WebView.swift
//  Final_Project
//
//  Created by Cullen Vaughan on 7/7/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView { return WKWebView() }
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

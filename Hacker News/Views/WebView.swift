//
//  WebView.swift
//  Hacker News
//
//  Created by Carlos Magno de França Veiga on 10/03/21.
//

import Foundation
import WebKit
import SwiftUI

//Permite criar um SwiftUIView que representa um UIKitView
//Essa estrutura será a nossa view de apresentação da página referenciada pela url
struct WebView: UIViewRepresentable {

    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}

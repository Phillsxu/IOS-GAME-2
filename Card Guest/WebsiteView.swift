//
//  WebsiteView.swift
//  Card Guest
//
//  Created by User04 on 2021/3/23.
//

import SwiftUI
import SafariServices

struct WebsiteView: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> SFSafariViewController {
         SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
            
    }
    let url: URL
}

//
//  loseView.swift
//  Card Guest
//
//  Created by User04 on 2021/3/23.
//

import SwiftUI

struct loseView: View {
    @Binding var lose: Bool
    var body: some View {
        ZStack {
            Color.red
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("BUST")
                Text("You Lose")
            }
        }
        .overlay(
            Button(action: {
                lose = false
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(20)
            }), alignment: .topTrailing)
    }
}


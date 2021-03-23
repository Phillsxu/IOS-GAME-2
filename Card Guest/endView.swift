//
//  endView.swift
//  Card Guest
//
//  Created by User04 on 2021/3/23.
//

import SwiftUI

struct endView: View {
    @Binding var gameover: Bool
    @Binding var PlayPage: Bool
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("GAME OVER")
                    .foregroundColor(Color.white)
            }
        }
        .overlay(
            Button(action: {
                gameover = false
                PlayPage = false
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(20)
            }), alignment: .topTrailing)
    }
}

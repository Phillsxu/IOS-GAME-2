//
//  winView.swift
//  Card Guest
//
//  Created by User04 on 2021/3/23.
//

import SwiftUI

struct winView: View {
    @Binding var won: Bool
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("YOU WIN")
                Text("Well Played")
            }
        }
        .overlay(
            Button(action: {
                won = false
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding(20)
            }), alignment: .topTrailing)
    }
}

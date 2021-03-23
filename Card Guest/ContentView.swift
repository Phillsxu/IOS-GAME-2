//
//  ContentView.swift
//  Card Guest
//
//  Created by User04 on 2021/3/23.
//

import SwiftUI

struct Home: View {
    @State private var PlayPage = false
    @State private var Web = false
    var body: some View {
        ZStack{
            Image("home")
                .resizable()
                .scaleEffect(CGSize(width: 1.2, height: 1.2))
            Rectangle()
                .fill(Color.white)
                .frame(width: 400, height: 400)
                .opacity(0.85)
            VStack{
                VStack{
                    Text("WELCOME TO")
                        .font(.system(size: 30))
                    HStack{
                        Text("Hi")
                            .foregroundColor(.green)
                            .font(.system(size: 60))
                        Text("-")
                            .font(.system(size: 60))
                        Text("Lo")
                            .foregroundColor(.red)
                            .font(.system(size: 60))
                    }
                }
                .padding()
                Button(action: {
                    PlayPage = true
                }, label: {
                        Text("PLAY")
                            .font(.system(size: 40))
                })
                .fullScreenCover(isPresented: $PlayPage, content: { Play(PlayPage: $PlayPage)
                })
                Button(action: {
                    Web = true
                }, label: {
                        Text("Rules")
                            .font(.system(size: 20))
                })
                .sheet(isPresented: $Web) {
                            WebsiteView(url: URL(string: "https://smartcasinoguide.com/high-low-card-game/")!)
                        }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

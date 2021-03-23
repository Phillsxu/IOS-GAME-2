//
//  Play.swift
//  Card Guest
//
//  Created by User04 on 2021/3/23.
//

import SwiftUI

struct Play: View {
    @State var card1 = cards.randomElement()!
    @Binding var PlayPage: Bool
    @State private var win = 0
    @State private var money = 5000
    @State private var getmoney = 0
    @State private var play = 0
    @State private var lose = false
    @State private var won = false
    @State private var gameover = false
    var before = 0
    var x = 0
    var body: some View {
        ZStack{
            Image("desk")
                .scaleEffect(CGSize(width: 1.0, height: 5.0))
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 550, height: 700)
            VStack {
                Image(card1.rank+"_of_"+card1.suit)
                HStack {
                    VStack {
                        if(play == 0){
                            Button(action: {
                                if(money >= 500){
                                    card1 = cards.randomElement()!
                                    getmoney = 0
                                    win = 0
                                    play = 1
                                    money -= 500
                                }
                                else{
                                    gameover = true
                                }
                            }, label: {
                                Text("PLAY")
                            })
                            .sheet(isPresented: $gameover, content: { endView(gameover: $gameover, PlayPage: $PlayPage)
                            })
                        }
                        if(play == 1){
                            HStack{
                                Button(action: {
                                    let before: Int? = Int(card1.rank)
                                    card1 = cards.randomElement()!
                                    let x: Int? = Int(card1.rank)
                                    if(x ?? 0 > before ?? 0){
                                        win = win + 250
                                        getmoney += (win)
                                    }
                                    if(x ?? 0 < before ?? 0){
                                        getmoney = 0
                                        lose = true
                                        play = 0
                                    }
                                    if(x ?? 0 == before ?? 0){
                                        getmoney += 125
                                        money += getmoney
                                        won = true
                                        play = 0
                                    }
                                }, label: {
                                    Text("  UP  ")
                                })
                                .sheet(isPresented: $lose, content: { loseView(lose: $lose)
                                })
                                Button(action: {
                                    let before: Int? = Int(card1.rank)
                                    card1 = cards.randomElement()!
                                    let x: Int? = Int(card1.rank)
                                    if(x ?? 0 < before ?? 0){
                                        win = win + 250
                                        getmoney += (win)
                                    }
                                    if(x ?? 0 > before ?? 0){
                                        getmoney = 0
                                        lose = true
                                        play = 0
                                    }
                                    if(x ?? 0 == before ?? 0){
                                        getmoney += 125
                                        money += getmoney
                                        won = true
                                        play = 0
                                    }
                                }, label: {
                                    Text("DOWN")
                                })
                                .sheet(isPresented: $lose, content: { loseView(lose: $lose)
                                })
                            }
                            Button(action: {
                                money += getmoney
                                won = true
                                play = 0
                            }, label: {
                                Text("STAND")
                            })
                            .sheet(isPresented: $won, content: { winView(won: $won)
                            })
                        }
                    }
                }
                Text("Win: " + String(getmoney))
                Text("Money: " + String(money))
                Button(action: {
                    gameover = true
                }, label: {
                    Text("Go Back")
                })
            }
            .font(.largeTitle)
        }
    }
}

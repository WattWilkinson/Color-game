//
//  ContentView.swift
//  Color game
//
//  Created by Melissa Wilkinson on 7/20/20.
//  Copyright © 2020 Watt Wilkinson. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore
struct ContentView: View {
    @State var score = 0
    @State var timer = 15
    @State var text = "Start"
    @State var color = Color.green
    @State var colors = [Color.red : "red", Color.green: "green", Color.blue : "blue", Color.black : "black", Color.orange : "orange", Color.yellow : "yellow", Color.purple : "purple", Color.pink : "pink"]
    @State var colorss = ["red", "green", "blue", "black", "orange", "pink", "purple", "yellow"]
    @State var colorString = "green"
    @State private var buttonDisabled = true
    @State var player = "Watt"
    var db = Firestore.firestore()
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    NavigationLink(destination: InstructionsView()) {
                        Text("Instructions").font(Font.system(size: 15, weight: .heavy, design: .rounded))
                        Image(systemName: "info.circle").font(Font.system(size: 20)).foregroundColor(Color.white).padding().background(Color.blue).cornerRadius(20)
                }.font(Font.system(size: 20)).foregroundColor(Color.white).padding().background(Color.blue).cornerRadius(20)
                    NavigationLink(destination: Leaderboard()) {
                            Text("Leaderboard").font(Font.system(size: 14, weight: .heavy, design: .rounded))
                            Image(systemName: "info.circle").font(Font.system(size: 20)).foregroundColor(Color.white).padding().background(Color.blue).cornerRadius(20)
                    }.font(Font.system(size: 20)).foregroundColor(Color.white).padding().background(Color.blue).cornerRadius(20)}
                       Text("Score: \(score)").font(Font.custom("HelveticaNeue-CondensedBlack", size: 33)).foregroundColor(Color.red)
                      
                       Text("Time: \(timer)").font(Font.custom("HelveticaNeue-CondensedBlack", size: 33)).foregroundColor(Color.purple)
                       Spacer()
                       Button(action: {}) {
                           Text(text).font(.system(size: 60, weight: .heavy, design: .rounded)).foregroundColor(color).onTapGesture {
                               self.startGame()
                           }
                           
                       }
                       Spacer()
                       VStack(spacing: 20) {
                           HStack(spacing: 5) {
                               
                               Button(action: {self.checkButton(colorOfButtonPress: "red")}) {
                                   Text("Red").font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                                   }.padding(.all,20 ).frame(maxWidth: .infinity).background(Color.red).cornerRadius(22).disabled(buttonDisabled)
                                Spacer()
                               Button(action: {self.checkButton(colorOfButtonPress: "green")}) {
                                    Text("Green").font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                                   } .padding(.all, 20).frame(maxWidth: .infinity).background(Color.green).cornerRadius(22).disabled(buttonDisabled)
                                
                            }
                           
                            HStack {
                               Button(action: {self.checkButton(colorOfButtonPress: "blue")}) {
                                  Text("Blue").font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                              }.padding(.all, 20).frame(maxWidth: .infinity).background(Color.blue).cornerRadius(22).disabled(buttonDisabled)
                                Button(action: {self.checkButton(colorOfButtonPress: "black")}) {
                                    Text("Black").font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                                }.padding(.all, 20 ).frame(maxWidth: .infinity).background(Color.black).cornerRadius(22).disabled(buttonDisabled)
                                }
                            
                           
                            HStack {
                              Button(action: {self.checkButton(colorOfButtonPress: "orange")}) {
                                  Text("Orange").font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                              }.padding(.all, 20).frame(maxWidth: .infinity).background(Color.orange).cornerRadius(22).disabled(buttonDisabled)
                                Button(action: {self.checkButton(colorOfButtonPress: "pink")}) {
                                    Text("Pink").font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                                }.padding(.all, 20 ).frame(maxWidth: .infinity).background(Color.pink).cornerRadius(22).disabled(buttonDisabled)
                                }
                            
                             HStack {
                               Button(action: { self.checkButton(colorOfButtonPress: "purple")}) {
                                   Text("Purple").font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                               }.padding(.all, 20).frame(maxWidth: .infinity).background(Color.purple).cornerRadius(22).disabled(buttonDisabled)
                                 Button(action: {self.checkButton(colorOfButtonPress: "yellow")}) {
                                     Text("Yellow").font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(Color.white)
                                 }.padding(.all, 20 ).frame(maxWidth: .infinity).background(Color.yellow).cornerRadius(22).disabled(buttonDisabled)
                                 }
                       }.padding(.horizontal, 20).navigationBarTitle("Welcome to the Color Game", displayMode: .inline)
                       }
        }
       
        }
    func startGame() {
        if timer == 15 {
            buttonDisabled = false
            countDown()
            newColor()
        }
        if timer == 0 {
        timer = 15
        score = 0
        text = "Start"
        }
    }
    func countDown() {
        if timer > 0 {
            let seconds = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.timer = self.timer - 1
                self.countDown()
            }
        }else {
            text = ("Start Over!")
            buttonDisabled = true
            self.checkScore()
            
        }
    }
    func newColor() {
        color = colors.keys.randomElement()!
        colorString = colors[color]!
        if let index = colorss.firstIndex(of: colorString) {
            colorss.remove(at: index)
            text = colorss.randomElement()!
            colorss.append(colorString)
            print("color string", colorString)
            print("text", text)
        }
    }
    func checkButton(colorOfButtonPress : String) {
        if colorOfButtonPress == colorString {
            print("Nice! +1")
            score = score + 1
            self.newColor()
        }
    }
    func checkScore() {
        let docRef = db.collection("leaderboard").document(player)
        docRef.getDocument {
            (document, error) in
            if let document = document, document.exists {
                if var highScore = document.get("score") as? Int {
                    print("userhighscore", highScore)
                    if self.score > highScore {
                        self.uploadscore()
                    }
                }
            }else {
                print("Document does not exist")
                self.uploadscore()
            }
        }
    }
            func uploadscore() {
                self.db.collection("leaderboard").document(self.player).setData([
                    "name" : self.player, "score" : self.score
                           ]) {err in
                               if let err = err {
                                   print("Error writing the document")
                                   print(err)
                               }else {
                                   print("Document succesfully written! It worked!")
                               }
            }
        }
        
      
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

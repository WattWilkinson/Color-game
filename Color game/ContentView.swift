//
//  ContentView.swift
//  Color game
//
//  Created by Melissa Wilkinson on 7/20/20.
//  Copyright © 2020 Watt Wilkinson. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var score = 0
    @State var timer = 15
    var body: some View {
        VStack {
            Text("Welcome to the color game!").font(.system(size: 44, weight: .bold, design: .rounded))
          
            Text("Score: \(score)")
           
            Text("Time: \(timer)")
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Start").font(.system(size: 77, weight: .heavy, design: .rounded))
                
            }
            Spacer()
            VStack(spacing: 20) {
                HStack(spacing: 5) {
                    
                     Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                         Text("Red").font(.system(size: 22, weight: .bold, design: .rounded))
                     }.padding(.all,20 ).frame(maxWidth: .infinity).background(Color.red).cornerRadius(22)
                     Spacer()
                     Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                         Text("Green").font(.system(size: 22, weight: .bold, design: .rounded))
                     } .padding(.all, 20).frame(maxWidth: .infinity).background(Color.green).cornerRadius(22)
                     
                 }
                
                 HStack {
                   Button(action: {}) {
                       Text("Blue").font(.system(size: 22, weight: .bold, design: .rounded))
                   }.padding(.all, 20).frame(maxWidth: .infinity).background(Color.blue).cornerRadius(22)
                     Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                         Text("Black").font(.system(size: 22, weight: .bold, design: .rounded))
                     }.padding(.all, 20 ).frame(maxWidth: .infinity).background(Color.black).cornerRadius(22)
                     }
                 
                
                 HStack {
                   Button(action: {}) {
                       Text("Orange").font(.system(size: 22, weight: .bold, design: .rounded))
                   }.padding(.all, 20).frame(maxWidth: .infinity).background(Color.orange).cornerRadius(22)
                     Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                         Text("Pink").font(.system(size: 22, weight: .bold, design: .rounded))
                     }.padding(.all, 20 ).frame(maxWidth: .infinity).background(Color.pink).cornerRadius(22)
                     }
                 
                  HStack {
                    Button(action: {}) {
                        Text("Purple").font(.system(size: 22, weight: .bold, design: .rounded))
                    }.padding(.all, 20).frame(maxWidth: .infinity).background(Color.purple).cornerRadius(22)
                      Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                          Text("Yellow").font(.system(size: 22, weight: .bold, design: .rounded))
                      }.padding(.all, 20 ).frame(maxWidth: .infinity).background(Color.yellow).cornerRadius(22)
                      }
            }
            }
        }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


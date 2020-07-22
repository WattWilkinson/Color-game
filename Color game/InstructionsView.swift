//
//  InstructionsView.swift
//  Color game
//
//  Created by Melissa Wilkinson on 7/22/20.
//  Copyright © 2020 Watt Wilkinson. All rights reserved.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack {
            Text("You have 15 seconds to get the most points possible!").font(Font.system(size: 36, weight: .heavy, design: .rounded)).multilineTextAlignment(.center)
            Text("Click on the button with the color of the text, not the text itself!").font(Font.system(size: 20, weight: .regular, design: .rounded)).multilineTextAlignment(.center).padding()
            Text("Yellow").font(Font.system(size: 101, weight: .heavy, design: .rounded)).foregroundColor(Color.blue).padding()
            Text("For example, this would be blue").font(Font.system(size: 22, weight: .bold, design: .rounded))
            Text("Blue").font(Font.system(size: 101, weight: .heavy, design: .rounded)).foregroundColor(Color.orange).padding()
            Text("And this would be orange").font(Font.system(size: 22, weight: .bold, design: .rounded))
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}

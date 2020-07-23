//
//  Leaderboard.swift
//  Color game
//
//  Created by Melissa Wilkinson on 7/23/20.
//  Copyright © 2020 Watt Wilkinson. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore
struct Leaderboard: View {
    var db = Firestore.firestore()
    @State var leaderboard = ["Leaderboard"]
    var body: some View {
        List(leaderboard, id : \.self) {Text($0)}
            .onAppear(perform: getData)
    }
    func getData() {
        db.collection("leaderboard").order(by: "score", descending: true).getDocuments() {
            (QuerySnapshot, err) in
            if let err = err {
                print("There was an error getting the document", err)
            }
            else {
                for document in QuerySnapshot!.documents {
                    let name = document.get("name") as! String
                    let score = document.get("score") as! Int
                    self.leaderboard.append("\(name) : \(String(score))")
                }
            }
        }
    }
}

struct Leaderboard_Previews: PreviewProvider {
    static var previews: some View {
        Leaderboard()
    }
}

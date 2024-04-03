//
//  ContentView.swift
//  cloudAttack
//
//  Created by Jeremy Skrdlant on 4/13/22.
//

import SwiftUI

struct ContentView: View {
    //This will choose which view to show the user
    //based on if they have joined the server
    //or not. Try changing it from false to true
    //and then back again. 
    @State var userIsIn:Bool = false
    
    //You will modify this to show the proper
    //Views.
    @ViewBuilder
    var body: some View {
        if userIsIn {
            Text("Play Game")
        }else{
            Text("Create a User")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

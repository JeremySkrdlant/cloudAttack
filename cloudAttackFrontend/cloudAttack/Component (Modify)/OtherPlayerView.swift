//
//  OtherPlayerView.swift
//  cloudAttack
//
//  This is the view to see the stats of another
//  player.  There is an entire list of these so
//  you are designing a basic repeating component.
//  Think of it like Facebook.  Each post is unique
//  but each spot has a template that the post fits
//  in.
//
//  You will modify this to show the data you want
//  to see and add a button to allow you to attack
//  them.

import SwiftUI

struct OtherPlayerView: View {
    //Variable area, do not modify.
    //This stores all the data of the player
    var otherPlayer:Player
    //This stores our ID, it will get set when
    //the list creates this view.
    var ourID:Int = -1
    
    
    var body: some View {
        VStack {
            Text(otherPlayer.name)
        }
        
    }
}

struct OtherPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        OtherPlayerView(otherPlayer: Player(name: "Bill Gates", attackLevel: 70, defenseLevel: 30, id: 1975, health: 55.55, attacking: -1) )
    }
}

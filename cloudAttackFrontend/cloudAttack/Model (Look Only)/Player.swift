//
//  Player.swift
//  cloudAttack
//
//  This is a representation of a player.
//  It has all the properties of what a player is.
//  You are an instance of a player and so are all your opponents.

import Foundation

struct Player:Identifiable, Hashable, Decodable{
    
    //String = word,  Int = non decimal number like 5,
    //Double = decimal number like 5.5 
    var name:String
    //The bigger this number the more damage you cause
    var attackLevel: Int
    //The bigger this number, the less damage you take
    var defenseLevel: Int
    //This is given out by the server.
    var id:Int
    //You start out with a 100 of this.
    var health:Double
    //This is the id of the opponent you are attacking,
    //it is -1 if you are healing
    var attacking:Int
}

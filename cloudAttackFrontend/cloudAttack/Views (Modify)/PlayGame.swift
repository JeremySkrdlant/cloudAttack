//
//  PlayGame.swift
//  cloudAttack
//
//  Created by Jeremy Skrdlant on 4/13/22.
//

import SwiftUI

struct PlayGame: View {
    @State var id:Int = -1
    @ObservedObject var model = ViewModel.shared
   
    
    var body: some View {
        VStack {
            Text("Health  -  \(model.us?.health ?? 0)")
                .kerning(1.5)
                .foregroundColor(Color(.displayP3, red: 0.2, green: 0.2, blue: 0.2, opacity: 1))
            List(model.players){
                player in
                if(player.id != model.us?.id){
                 OtherPlayerView(otherPlayer: player, ourID: id)
                }
            }
            
            Button {
                //----------------------------
                //Add Your Code Here
                
                
                
                //End of editing code area
                //-----------------------------
            } label: {
                Text("Heal Yourself")
                    .bold()
                    .kerning(2)
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

struct PlayGame_Previews: PreviewProvider {
    static var previews: some View {
        PlayGame()
    }
}

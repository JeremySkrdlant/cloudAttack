//
//  CreatePlayerView.swift
//  cloudAttack
//
//  You will be updating the button action
//  in this file.  The area is marked out with
//  some comment lines(---)
//

import SwiftUI

struct CreatePlayerView: View {
    //This allows our parent screen to
    //see if we have logged in yet.
    @Binding var playerCreated:Bool
    
    //These are state variables.  They are linked
    //to the components on the string.  When a
    //user types in a name or updates the slider,
    //the values of these change.
    @State var userName:String = ""
    @State var attackAmount:Double = 50.0
    
    var body: some View {
        VStack {
            TextField("Your Name", text: $userName)
                .padding(3)
                .border(Color.gray)
                .padding(.bottom, 30.0)
            
            HStack{
                Image("Shield")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                Slider(value: $attackAmount, in: 1...100)
                Image("Knife")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
            }
            .padding(.bottom, 30)
            
            Button {
                //---------------------------------
                //Add Your Code Here
                
                
                
                //End of editing code area
                //---------------------------------
            } label: {
                Text("SUBMIT")
                    .bold()
                    .kerning(2)
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .shadow(color: .black, radius: 2, x: 2, y: 2)
                    .foregroundColor(.white)
                
            }
        }
    }
}

struct CreatePlayerView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlayerView(playerCreated: .constant(false))
    }
}

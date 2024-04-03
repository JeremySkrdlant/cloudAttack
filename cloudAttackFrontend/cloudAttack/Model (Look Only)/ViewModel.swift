//
//  ViewModel.swift
//  cloudAttack
//
//  This class handles all the networking,
//  You will use its functions but you shouldn't need to modify it.
//

import Foundation

// ---------------------------------------------------------------
//      Private Code
//      Look but do not touch
// ---------------------------------------------------------------

class ViewModel:ObservableObject{
    @Published var players:[Player] = []
    @Published var us:Player?
    var id = -1
    
    static var shared:ViewModel = ViewModel()
    
    var baseURL = "http://cloudJS.local:4000"
    
    //This code takes a url, then gets back the result from our server
    //and updates the players and the us variables above.
    private func updateWithURL(urlString:String, setUs:Bool){
        //This helps us debug the project to make sure we are calling the
        //correct string.
        let cleanURLString = urlString.replacingOccurrences(of: " ", with: "%20")
        print(cleanURLString)
        
        //convert to a URL
        guard let url = URL(string: cleanURLString) else {
            print("Error with url: \(cleanURLString)")
            return
        }
      
        do{
            //This calls our server.
            let data = try Data(contentsOf: url)
            
            //Convert it to our object.
            let decoder = JSONDecoder()
            players = try decoder.decode([Player].self, from: data)
            
            //updates us for the first time, used for the view.
            if setUs {
                us = players.last
                id = us!.id
            }else {
                us = getUserById(id: id)
            }
        }catch{
            //We let the programmers know if something goes wrong.
            print(error.localizedDescription)
        }
    }
    
    private func getUserById(id:Int)->Player?{
        //we get our one player from the array of all the players.
        let results = players.filter { player in
            return player.id == id;
        }
        return results.first
    }
    
    func addUser(userName:String, attackLevel:Int){
        //build the urlString for adding a player
        //Our server requires a name and an attack level, it builds the rest
        //for us.
        let urlString = "\(baseURL)/addPlayer/\(userName)/\(attackLevel)"
        updateWithURL(urlString: urlString, setUs: true)
    }
    
    func getStatus()->Int{
        //Try to do the code above except for the status route.
        let urlString = "\(baseURL)/status"
        updateWithURL(urlString: urlString, setUs: false)
        id = us?.id ?? -1
        return id
    }
    
    //This takes your id and the opponents ID that you want to attack.
    //The rules follow
    // You attack someone that is healing, will not do much to their health. 
    func attack(yourID:Int, theirID:Int){
        let urlString = "\(baseURL)/attackPlayer/\(yourID)/\(theirID)"
        updateWithURL(urlString: urlString, setUs: false)
    }
    
    //This takes your ID, on the server it puts you in a mode where you are
    //healing,  each time you call this function, you get more health.
    func heal(yourID:Int){
        let urlString = "\(baseURL)/healPlayer/\(yourID)"
        updateWithURL(urlString: urlString, setUs: false)
    }
    
}

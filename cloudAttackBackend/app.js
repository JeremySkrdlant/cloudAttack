//Create the express app tool
let express = require("express");
let app = express();
let currentPlayer = 0;
let allPlayers = []

class Player{
  constructor(name, attack){
    this.name = name;
    this.attackLevel = attack;
    this.defenseLevel = 100 - attack;
    currentPlayer += 1;
    this.id = currentPlayer;
    this.health = 100;
    this.lastUpdate = new Date();
    this.attacking = -1;
  }

  applyHealth(){
    let now = new Date()
    console.log(now - this.lastUpdate);
    this.attacking = -1;
    let healAmount = this.defenseLevel / 3;
    this.health += healAmount + 20
  }

  attackPlayer(id){
    this.attacking = id;
    let otherPlayer = getPlayerById(id);
    //The other player is healing
    if (otherPlayer.attacking == -1){
      let defenseLevel = otherPlayer.defenseLevel * 1.5;
      if (this.attackLevel < defenseLevel){
        otherPlayer.health -= 10;
        return
      }
      let damageLevel  = (this.attackLevel - defenseLevel) / 2;
      otherPlayer.health -= damageLevel;
      return
    }
    //The other player is attacking you.
    if (otherPlayer.attacking == this.id){
      let damage = Math.abs(otherPlayer.attackLevel - this.attackLevel);
      if (otherPlayer.attackLevel > this.attackLevel){
        if (this.health > otherPlayer.health){
          this.health -= damage / 4
        }else {
          this.health -= damage / 2
        }
      }
      return
    }

    //They got caught attacking someone else.
    let damage = this.attackLevel - otherPlayer.defenseLevel;
    if (damage < 0){
      otherPlayer.health -= 10
    }else {
      let damageValue = Math.min(damage / 2, 40);
      otherPlayer.health -= damageValue;
    }
  }
}

function getPlayerById(idNumber){
  let matches = allPlayers.filter((player)=>{
    return player.id == idNumber;
  })
  if (matches.length == 1){
    return matches[0]
  }
  return undefined
}

app.get("/", (request, response)=>{
  response.send({"routes":["addPlayer/:name/:attack#", "attackPlayer/:myID/:theirID", "healPlayer/:myID", "status"]});
});

app.get("/addPlayer/:name/:attack", (req, resp)=>{
  let {name, attack} = req.params;
  let attackLevel = parseInt(attack);
  let newPlayer = new Player(name, attackLevel)
  allPlayers.push(newPlayer);
  resp.send(allPlayers)
});

app.get("/attackPlayer/:myID/:theirID", (req, resp)=>{
  let {myID, theirID} = req.params;
  let me = parseInt(myID);
  let them = parseInt(theirID);

  let thisPlayer = getPlayerById(myID);
  if (thisPlayer == undefined){
    resp.send([]);
    return
  }
  thisPlayer.attackPlayer(them);
  resp.send(allPlayers)

});

app.get("/healPlayer/:myID", (req, resp)=>{
  let {myID} = req.params;
  let thisPlayer = getPlayerById(parseInt(myID));
  if (thisPlayer == undefined){
    resp.send([])
    return
  }
  thisPlayer.applyHealth()
  resp.send(allPlayers)
});

app.get("/status", (req, resp)=>{
  resp.send(allPlayers)
});

app.get("/clearDaGamez", (req, resp)=>{
  allPlayers = [];
  resp.send(allPlayers)
})

app.get("/clearGame", (req, resp)=>{
  resp.send(["Oooof"])
})

//start the server on port 4000;
app.listen(4000);
console.log("Listening on port 4000");

//
//  FieRole.swift
//  match3
//
//

import Foundation

struct FieRole:Identifiable {
    let id = UUID()
    let bannImg:String
    let nm:String
    let img:String
    let des:String
    let keysf:[String]
    let ex:[String]
    static let fieroles:[FieRole] = [
        .init(bannImg: "gk_banner",
              nm: "GOALKEEPER",
              img: "gk1",
              des: "Goalkeepers are the ultimate guardians, equipped with quick reflexes and keen anticipation",
              keysf: [
                "Preventing the opposing team from scoring",
                "Shot-stopping",
                "Commanding the penalty area during set-pieces",
                "Initiating attacks with precise distribution"
              ],
              ex: [
                "Alisson Becker (Liverpool)",
                "Renowned for his shot-stopping abilities and excellent distribution, Alisson played a crucial role in Liverpool's recent successes"
              ]),
        .init(bannImg: "def_banner",
              nm: "Defender",
              img: "gk2",
              des: "Defenders are the sentinels, precise tackling to deny opponents any clear path to goal",
              keysf: [
                "Central defenders (CB) provide a solid foundation, thwarting attacks and initiating build-up play",
                "Full-backs (RB and LB) contribute both defensively and offensively, often overlapping wingers and delivering crosses into the box"
              ],
              ex: [
                "Virgil van Dijk (Liverpool)",
                "Known for his commanding presence, van Dijk is a central defender who excels in aerial duels and is a key player in initiating attacks"
              ]),
        .init(bannImg: "mid_banner",
              nm: "Midfielder",
              img: "gk3",
              des: "Midfielders possess a blend of vision, passing accuracy, and defensive prowess",
              keysf: [
                "Defensive midfielders (CDM) break up opposition attacks and shield the defense",
                "Central midfielders (CM) control the tempo, while attacking midfielders (CAM) create goal-scoring opportunities"
              ],
              ex: [
                "Kevin De Bruyne (Manchester City)",
                "An exemplary central midfielder, De Bruyne combines vision, passing, and goal-scoring ability, making him a complete midfielder"
              ]),
        .init(bannImg: "w_banner",
              nm: "Winger",
              img: "gk4",
              des: "Wingers are the accelerators, using their speed and agility to create goal-scoring opportunities",
              keysf: [
                "Beating defenders one-on-one, delivering accurate crosses, and scoring goals"
              ],
              ex: [
                "Lionel Messi (Inter Miami)",
                "Though primarily a forward, Messi's early career saw him play as a winger. His dribbling and goal-scoring prowess are legendary"
              ]),
        .init(bannImg: "s_banner",
              nm: "Striker",
              img: "gk5",
              des: "Strikers are the sharpshooters. They have skills to convert chances into goals",
              keysf: [
                "Center forwards (CF) link play between midfield and attack",
                "Traditional strikers (ST) focus on finishing chances",
                "Positioning, hold-up play, and clinical finishing"
              ],
              ex: [
                "Robert Lewandowski (Bayern Munich)",
                "Renowned for his goal-scoring prowess, Lewandowski is a striker who excels in positioning and finishing"
              ]),
        .init(bannImg: "am_banner",
              nm: "Attacking Midfielder",
              img: "gk6",
              des: "Attacking midfielders possess the vision to unlock defenses and the skill to score crucial goals",
              keysf: [
                "Operate in the final third",
                "Unlock defenses with vision, precise passing, and the ability to score",
                "The AM links midfield and attack, acting as the team's creative hub"
              ],
              ex: [
                "Bruno Fernandes (Manchester United)",
                "Known for his vision and playmaking abilities, Fernandes is a prime example of a modern attacking midfielder"
              ]),
        .init(bannImg: "cb_banner",
              nm: "Central Back",
              img: "gk7",
              des: "Central backs ensure defensive organization and thwarting opposing attacks",
              keysf: [
                "A central back (CB) provides defensive solidity",
                "Organize the defensive line, communicate with teammates, and contribute in set-piece situations"
              ],
              ex: [
                "Ruben Dias (Manchester City)",
                "An exemplary central defender, Dias played a pivotal role in Manchester City's defensive success with his composure and leadership"
              ]),
        .init(bannImg: "dl_banner",
              nm: "Deep-Lying Playmaker",
              img: "gk8",
              des: "Deep-lying playmakers possess vision, passing accuracy, and the ability to control the game’s pace",
              keysf: [
                "The deep-lying playmaker dictates play from deep positions, distributing accurate long-range passes to initiate attacks",
                "Act as the team's metronome, controlling the tempo and orchestrating from behind"
              ],
              ex: [
                "Luka Modric (Real Madrid)",
                "Renowned for his passing range and vision, Modric is a deep-lying playmaker who played a crucial role in Real Madrid's success"
              ])
    ]
}
 

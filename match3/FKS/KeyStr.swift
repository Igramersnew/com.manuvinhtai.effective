//
//  KeyStr.swift
//  match3
//
//

import Foundation

struct KeyStr: Identifiable {
    let id:Int
    let nm:String
    let str:String
    let ex:String
    static let keystrs:[KeyStr] = [
        .init(id: 0, nm: "Possession-based Play: The Tiki-Taka Philosophy",
              str: "Possession-based play, famously known as Tiki-Taka, involves maintaining control of the ball through quick, short passes. This strategy aims to wear down opponents, create openings, and control the tempo of the game.",
              ex: "FC Barcelona (2008-2012): Under the guidance of Pep Guardiola, Barcelona became synonymous with Tiki-Taka, dominating matches with their intricate passing and positional play"),
        .init(id: 1, nm: "Counter-Attacking Mastery",
              str: "Counter-attacking focuses on swiftly transitioning from defense to offense, exploiting open spaces left by attacking opponents. Quick, direct passes and rapid movements capitalize on the element of surprise",
              ex: "Real Madrid (2011-2018): Coached by Jose Mourinho and later Zinedine Zidane, Real Madrid showcased lethal counter-attacks, utilizing the speed of players like Cristiano Ronaldo and Gareth Bale"),
        .init(id: 2, nm: "High Pressing: Winning the Ball Upfield",
              str: "High pressing involves aggressively closing down opponents in their defensive third to win back possession quickly. This strategy disrupts the opponent's build-up and can lead to turnovers in advantageous positions",
              ex: "Liverpool (2017-present): Under Jurgen Klopp, Liverpool has mastered high pressing, with energetic forwards and midfielders relentlessly pressuring opponents"),
        .init(id: 3, nm: "Compact Defending",
              str: "Compact defending aims to limit the space available to the opponent, making it challenging for them to create scoring opportunities. Teams maintain a tight defensive shape, reducing the effectiveness of the opponent's attacking play",
              ex: "Atletico Madrid (2014-present): Coached by Diego Simeone, Atletico Madrid is renowned for their compact defensive structure, making them a formidable force in European football"),
        .init(id: 4, nm: "Wide Play and Wing Attacks",
              str: "Utilizing wide players and wing attacks involves stretching the opponent's defense horizontally. Wingers provide width, creating space for central attackers and delivering crosses into the box",
              ex: "Bayern Munich (2019-present): Bayern Munich, particularly under Hansi Flick, employs dynamic wing play, with players like Serge Gnabry and Leroy Sane creating havoc on the flanks"),
        .init(id: 5, nm: "Fluid Formations",
              str: "Fluid formations allow teams to adapt their shape based on in-game situations. This flexibility enables seamless transitions between attacking and defensive phases, catching opponents off guard",
              ex: "Manchester City (2018-present): Coached by Pep Guardiola, Manchester City is known for fluid formations that adapt to various scenarios, providing a dynamic and unpredictable style of play"),
        .init(id: 6, nm: "Set-Piece Specialization",
              str: "Set-piece specialization involves meticulously planning and executing plays from set-pieces (corners, free-kicks). Teams capitalize on these opportunities to score goals and gain a strategic advantage",
              ex: "England National Team (2018-present): Under Gareth Southgate, England has emphasized set-pieces, utilizing the strengths of tall, aerially adept players for goal-scoring opportunities"),
        .init(id: 7, nm: "Zonal and Man-to-Man Defending",
              str: "Teams employ a combination of zonal and man-to-man defending based on specific situations. Zonal marking involves defending specific zones, while man-to-man marking assigns players to mark specific opponents",
              ex: "Chelsea (2020-present): Coached by Thomas Tuchel, Chelsea has showcased tactical versatility, seamlessly switching between zonal and man-to-man defending depending on the opponent and match circumstances")
    ]
}

//
//  Notor.swift
//  match3
//
//

import Foundation

struct Notor: Identifiable{
    let id = UUID()
    let nm:String
    let text:String
    static let notors:[Notor] = [
        .init(nm: "Calciopoli Scandal (2006)", text: "In 2006, Italian football was marred by the Calciopoli scandal. Several top clubs, including Juventus, AC Milan, and Lazio, were implicated in a match-fixing scandal where referees were accused of favoring certain teams. The fallout led to point deductions, relegations, and hefty fines, tarnishing the reputation of Italian football."),
        .init(nm: "Corruption (2015)", text: "In a shocking revelation that sent shockwaves through the football community, faced a massive corruption scandal in 2015. Top officials were arrested on charges of bribery, corruption, and racketeering. The scandal exposed corruption within, leading to numerous arrests, resignations, and reforms within the organization."),
        .init(nm: "Maradona's Hand (1986)", text: "Diego Maradona's \"Hand of God\" incident during the 1986 World Cup quarter-final between Argentina and England remains one of football's most controversial moments. Maradona punched the ball into the net, and despite protests, the goal stood. Argentina went on to win the World Cup, but the handball sparked debates about fair play."),
        .init(nm: "The Chinese Scandal (2009)", text: "Chinese football was hit by a match-fixing scandal in 2009, involving players, referees, and officials. The scandal revealed a widespread network of corruption where matches were manipulated for betting purposes. Numerous players and officials faced lifetime bans, signaling a severe crackdown on corruption within Chinese football."),
        .init(nm: "Bloodgate Scandal (2009)", text: "Although rugby, not football, was the stage for the Bloodgate scandal, its impact echoed across sports. In a Heineken Cup match, Harlequins' winger Tom Williams faked a blood injury to allow a tactical substitution. The scandal exposed a breach of sportsmanship and led to suspensions, fines, and a tarnished reputation for the club."),
        .init(nm: "Marseille Bribery (1993)", text: "French football giants Marseille were embroiled in a bribery scandal in 1993 that rocked the footballing world. The club was found guilty of match-fixing and attempting to bribe Valenciennes players before a crucial league match. Marseille faced relegation, were stripped of their French title, and banned from the Champions League."),
        .init(nm: "The FA's Betting (1964)", text: "In 1964, the Football Association (FA) was hit by a betting scandal that implicated several players. Jimmy Gauld and David Layne were among those found guilty of conspiring to fix matches. The scandal highlighted the vulnerability of footballers to external influences and led to lifetime bans for those involved"),
        .init(nm: "The Fake Passport (2000)", text: "Leeds United faced a scandal in 2000 when it was revealed that their Australian striker, Mark Viduka, had played under a fake passport. The scandal unfolded during Leeds' Cup run, resulting in fines and a tarnished reputation for the club. Viduka served a suspension, and the incident highlighted issues of player identity and eligibility.")
    ]
}

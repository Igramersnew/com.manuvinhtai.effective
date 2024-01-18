//
//  DTScene.swift
//  match3
//
//

import SwiftUI
import SpriteKit

enum Role: String, CaseIterable, Codable {
    case gk
    case lb
    case rb
    case lcb
    case rcb
    case lcm
    case rcm
    case lm
    case rm
    case lcf
    case rcf
    
    var full: String {
        switch self {
        case .gk:
            return "Goalkeeper"
        case .lb:
            return "Left-back"
        case .rb:
            return "Right-back"
        case .lcb:
            return "Left-central-back"
        case .rcb:
            return "Right-central-back"
        case .lcm:
            return "Left-central-midfield"
        case .rcm:
            return "Right-central-midfield"
        case .lm:
            return "Left-midfield"
        case .rm:
            return "Right-midfield"
        case .lcf:
            return "Left-central-forward"
        case .rcf:
            return "Right-central-forward"
        }
    }
    
    var capital: String {
        self.rawValue.uppercased()
    }
}

struct MapItem: Codable {
    var point:CGPoint
    let name:String
    let num:Int
    let role:Role
}

class DTScene: SKScene {
    @ObservedObject var dt: DT
    var map:SKSpriteNode = .init()

    init(_ dt: DT) {
        self.dt = dt
        super.init(size: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        scene?.size = view.frame.size
        let bck = SKSpriteNode(imageNamed: "bck")
        bck.position = .init(x: frame.midX, y: frame.midY)
        bck.size = frame.size
        addChild(bck)
        map = SKSpriteNode(imageNamed: "map")
        map.position = .init(x: frame.midX, y: frame.midY)
        addChild(map)
        
        let gkPos:CGPoint = .init(x: 0, y: -map.frame.height/2 + 40)

        let lbPos:CGPoint = .init(x: -map.frame.width/2 + 50, y: -map.frame.height/2 + 130)
        let rbPos:CGPoint = .init(x: map.frame.width/2 - 50, y: -map.frame.height/2 + 130)
        let lcbPos:CGPoint = .init(x: -50, y: -map.frame.height/2 + 110)
        let rcbPos:CGPoint = .init(x: 50, y: -map.frame.height/2 + 110)
        
        let lcmPos:CGPoint = .init(x: -50, y: -20)
        let rcmPos:CGPoint = .init(x: 50, y: -20)
        let lmPos:CGPoint = .init(x: -map.frame.width/2 + 50, y: 0)
        let rmPos:CGPoint = .init(x: map.frame.width/2 - 50, y: 0)
        
        let lcfPos:CGPoint = .init(x: -70, y: 90)
        let rcfPos:CGPoint = .init(x: 70, y: 90)
        
        dt.fpositions = [.gk:gkPos,
                         .lb:lbPos,
                         .rb:rbPos,
                         .lcb:lcbPos,
                         .rcb:rcbPos,
                         .lcm:lcmPos,
                         .rcm:rcmPos,
                         .lm:lmPos,
                         .rm:rmPos,
                         .lcf:lcfPos,
                         .rcf:rcfPos]
        
        build()
        
        print("state")
    }
    
    override func update(_ currentTime: TimeInterval) {
        if dt.rebuildScene {
            dt.rebuildScene = false
            map.removeAllChildren()
            build()
        }
    }
    
    func build() {
        for i in dt.mapItems {
            let tshirt = SKSpriteNode(imageNamed: "tshirt")
            tshirt.name = "tshirt"
            tshirt.position = i.point
            
            let num = SKLabelNode(text: "\(i.num)")
            num.fontSize = 13
            num.fontColor = .black
            num.fontName = "Audiowide"
            num.position = tshirt.position
            
            let name = SKLabelNode(text: i.name)
            name.fontSize = 13
            name.fontColor = .black
            name.fontName = "Audiowide"
            name.position = .init(x: tshirt.position.x, y: tshirt.position.y + 30)
            
            map.addChild(tshirt)
            map.addChild(num)
            map.addChild(name)
        }
    }
}

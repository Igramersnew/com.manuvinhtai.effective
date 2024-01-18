//
//  Woos.swift
//  match3
//
//

import Foundation

struct Woos: Identifiable{
    let id = UUID()
    let nm:String
    let img:String
    let des:String
    let woosItems:[WoosItem]
    static let wooses:[Woos] = [
        .init(nm: "Strength and Power",
              img: "e1",
              des: "Build football prowess with squats, deadlifts, and drills like box jumps. Enhance strength for tackles and power for dynamic plays",
              woosItems: [.sq,.lwd,.pr,.mdt,.ks,.dl,.bp,.bju]),
        .init(nm: "bALL Practice",
              img: "e2",
              des: "This workout combines skill development, strength training, and coordination exercises to improve your overall performance on the pitch",
              woosItems: [.bd,.pp,.jm,.bs,.dlu,.bps,.bpr,.sd]),
        .init(nm: "Cardiovascular Endurance",
              img: "e3",
              des: "Interval runs, shuttle sprints, jump rope simulate match conditions. Cycling sprints and rowing add cardiovascular challenges.",
              woosItems: [.ir,.sr,.jr,.ssu,.cd,.stp,.ii,.bdr])
    ]
}

struct WoosItem: Identifiable{
    let id = UUID()
    let nm:String
    let img:String
    let sts:[String]
    let time:Int
    static let sq:Self = .init(nm: "SQUATS",
                               img: "o1",
                               sts: [
                                "Stand with feet shoulder-width apart",
                                "Lower your body by bending your knees and hips",
                                "Keep your back straight and chest up",
                                "Push through your heels to return to the starting position"
                               ],
                               time: 12)
    static let lwd:Self = .init(nm: "Lunges with Dumbbells",
                                img: "o2",
                                sts: [
                                    "Hold dumbbells in each hand",
                                    "Step forward with one leg, lowering your hips until both knees are bent",
                                    "Return to the starting position and alternate legs"
                                ],
                                time: 12)
    static let pr:Self = .init(nm: "Plank Rows",
                               img: "o3",
                               sts: [
                                "Start in a plank position with a dumbbell in each hand",
                                "Row one dumbbell to your hip while maintaining a stable plank position",
                                "Repeat on the other side"
                               ],
                               time: 12)
    static let mdt:Self = .init(nm: "MEDICINE BALL TWISTS",
                                img: "o4",
                                sts: [
                                    "Sit on the ground, holding a medicine ball",
                                    "Twist your torso from side to side, touching the ground with the ball"
                                ],
                                time: 12)
    static let ks:Self = .init(nm: "Kettlebell Swings",
                               img: "o5",
                               sts: [
                                "Hold a kettlebell with both hands",
                                "Hinge at your hips and swing the kettlebell forward, then back between your legs",
                                "Drive your hips forward to swing the kettlebell to chest height"
                               ],
                               time: 12)
    static let dl:Self = .init(nm: "Deadlifts",
                               img: "o6",
                               sts: [
                                "Stand with feet hip-width apart, holding a barbell in front of you",
                                "Hinge at your hips and lower the barbell while keeping a neutral spine",
                                "Lift the barbell by straightening your hips and returning to a standing position"
                               ],
                               time: 12)
    static let bp:Self = .init(nm: "Bench Press",
                               img: "o7",
                               sts: [
                                "Lie on a bench with a barbell above your chest",
                                "Lower the barbell to your chest",
                                "Push the barbell back to the starting position, extending your arms"
                               ],
                               time: 12)
    static let bju:Self = .init(nm: "Box Jumps",
                                img: "o8",
                                sts: [
                                    "Lie on a bench with a barbell above your chest",
                                    "Lower the barbell to your chest",
                                    "Push the barbell back to the starting position, extending your arms"
                                ],
                                time: 12)
    static let bd:Self = .init(nm: "Ball Dribbling",
                               img: "o9",
                               sts: [
                                "Set up cones and practice dribbling a football ball around them",
                                "Focus on close ball control, quick changes of direction, and using both feet"
                               ],
                               time: 12)
    static let pp:Self = .init(nm: "Passing Precision",
                               img: "o10",
                               sts: [
                                "Stand facing a wall and pass the ball against it using both feet",
                                "Emphasize accuracy and control in your passing technique"
                               ],
                               time: 12)
    static let jm:Self = .init(nm: "Juggling Mastery",
                               img: "o11",
                               sts: [
                                "Practice juggling the football ball using your feet, thighs, and head",
                                "Start with a few touches and gradually increase complexity as you improve"
                               ],
                               time: 12)
    static let bs:Self = .init(nm: "Ball Squats",
                               img: "o12",
                               sts: [
                                "Hold the football ball with both hands at chest level",
                                "Hold the football ball with both hands at chest level"
                               ],
                               time: 12)
    static let dlu:Self = .init(nm: "Dynamic Lunges",
                                img: "o13",
                                sts: [
                                    "Hold the football ball with both hands",
                                    "Step forward into a lunge, twist your torso to the side of the leading leg, and return to the starting position",
                                    "Alternate legs"
                                ],
                                time: 12)
    static let bps:Self = .init(nm: "Ball Pass",
                               img: "o14",
                               sts: [
                                "Sit on the ground with legs extended",
                                "Pass the football ball side to side with a partner while keeping your core engaged",
                                "This exercise enhances core strength and passing accuracy."
                               ],
                               time: 12)
    static let bpr:Self = .init(nm: "Ball Plank Roll",
                                img: "o15",
                                sts: [
                                    "Start in a plank position with the football ball under your hands",
                                    "Roll the ball in a circular motion using your hands while maintaining a stable plank position"
                                ],
                                time: 12)
    static let sd:Self = .init(nm: "Shooting Drills",
                               img: "o16",
                               sts: [
                                "Set up cones as targets and practice shooting the ball at different distances",
                                "Focus on technique, accuracy, and striking the ball with various parts of your foot"
                               ],
                               time: 12)
    static let ir:Self = .init(nm: "Interval Runs",
                               img: "o17",
                               sts: [
                                "Alternate between high-intensity sprints and moderate-paced jogs",
                                "Follow a structured interval pattern (e.g., 2 minutes sprint, 1-minute jog)"
                               ],
                               time: 12)
    static let sr:Self = .init(nm: "Shuttle Runs",
                               img: "o18",
                               sts: [
                                "Set up cones and dribble a football around them",
                                "Focus on close ball control and quick changes of direction"
                               ],
                               time: 12)
    static let jr:Self = .init(nm: "Jump Rope",
                               img: "o19",
                               sts: [
                                "Incorporate various jump rope techniques, including single jumps, double unders, and crossovers",
                                "Maintain a steady rhythm for the entire duration"
                               ],
                               time: 12)
    static let ssu:Self = .init(nm: "Side Shuffles",
                                img: "o20",
                                sts: [
                                    "Perform lateral shuffles, maintaining a low stance",
                                    "Emphasize quick and controlled movements"
                                ],
                                time: 12)
    static let cd:Self = .init(nm: "Carioca Drill",
                               img: "o21",
                               sts: [
                                "Perform the carioca (grapevine) drill by crossing one foot over the other",
                                "Alternate the crossing pattern to improve hip mobility"
                               ],
                               time: 12)
    static let stp:Self = .init(nm: "stair sprints",
                                img: "o22",
                                sts: [
                                    "Sprint up and down stairs to challenge both cardiovascular fitness and lower body strength",
                                    "Perform for 2 minutes per set"
                                ],
                                time: 12)
    static let ii:Self = .init(nm: "Rowing Intervals",
                               img: "o23",
                               sts: [
                                "Row for 500 meters at a high intensity",
                                "Rest for 1 minute between sets"
                               ],
                               time: 12)
    static let bdr:Self = .init(nm: "Ball Drills",
                                img: "o24",
                                sts: [
                                    "Incorporate dribbling, passing, and shooting with a soccer ball for 10 minutes",
                                    "Focus on maintaining a high level of intensity"
                                ],
                                time: 12)
}

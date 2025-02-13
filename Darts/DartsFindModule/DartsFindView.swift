import SwiftUI
import SpriteKit

class GameModel: ObservableObject {
    @Published var isLose = false
    @Published var isWin = false
}

class FindGameView: SKScene, SKPhysicsContactDelegate {
    var game: GameModel?
    var positions: [CGPoint] = []
    var positions2: [CGPoint] = []
    var positions3: [CGPoint] = []
    var positions4: [CGPoint] = []
    var positions5: [CGPoint] = []
    var positions6: [CGPoint] = []
    var positions7: [CGPoint] = []
    var ball: SKSpriteNode!
    var level = UserDefaultsManager.defaults.object(forKey: Keys.levelFind.rawValue) as? Int ?? 0
    
    func setupView() {
        let gameBackground = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findBG.rawValue))
        gameBackground.size = CGSize(width: size.width, height: size.height)
        gameBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameBackground)
        
        let backForStage = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.backButton.rawValue))
        backForStage.size = CGSize(width: 110,
                                   height: 60)
        backForStage.position = CGPoint(x: size.width / 2,
                                        y: size.height / 1.14)
        addChild(backForStage)
        
        let stageLabel = SKLabelNode(fontNamed: ("SpicyRice-Regular"))
        stageLabel.text = "STAGE"
        stageLabel.fontColor = .purple
        stageLabel.fontSize = 24
        stageLabel.position = CGPoint(x: size.width / 2,
                                      y: size.height / 1.14)
        addChild(stageLabel)
        
        let levelLabel = SKLabelNode(fontNamed: ("SpicyRice-Regular"))
        levelLabel.text = "\(UserDefaultsManager.defaults.object(forKey: Keys.levelFind.rawValue) as? Int ?? 0)"
        levelLabel.fontColor = .purple
        levelLabel.fontSize = 24
        levelLabel.position = CGPoint(x: size.width / 2,
                                      y: size.height / 1.175)
        addChild(levelLabel)
        
        let pause = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.pausee.rawValue))
        pause.size = CGSize(width: 60,
                            height: 60)
        pause.position = CGPoint(x: size.width / 8,
                                 y: size.height / 1.14)
        addChild(pause)
        
        switch level {
        case 1:
            firstLevel()
        case 2:
            secondLevel()
        case 3:
            thirdLevel()
        case 4:
            fourthLevel()
        case 5:
            fifthLevel()
        case 6:
            sixthLevel()
        case 7:
            sevethLevel()
        default:
            sevethLevel()
        }
    }
    
    func firstLevel() {
        for item in 0..<3 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 5 + CGFloat(item * 120),
                                     y: size.height / 2)
            addChild(findIt)
            positions.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        ball = SKSpriteNode(imageNamed: DartsImageName.pinkBall.rawValue)
        ball.name = "ball"
        ball.size = CGSize(width: 40,
                            height: 40)
        ball.position = CGPoint(x: size.width / 2,
                                y: size.height / 1.7)
        addChild(ball)
        
        let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
        ball.run(moveAction) {
            self.ball.isHidden = true
        }
    }
    
    func secondLevel() {
        for item in 0..<1 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 1.97,
                                     y: size.height / 3)
            addChild(findIt)
            positions2.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions2.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions2[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        for item in 0..<3 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 5 + CGFloat(item * 120),
                                     y: size.height / 2)
            addChild(findIt)
            positions.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        ball = SKSpriteNode(imageNamed: DartsImageName.pinkBall.rawValue)
        ball.name = "ball"
        ball.size = CGSize(width: 40,
                            height: 40)
        ball.position = CGPoint(x: size.width / 2,
                                y: size.height / 1.7)
        addChild(ball)
        
        let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
        ball.run(moveAction) {
            self.ball.isHidden = true
        }
    }
    
    func thirdLevel() {
        for item in 0..<2 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 2 + CGFloat(item * 120),
                                     y: size.height / 3)
            addChild(findIt)
            positions3.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions3.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions3[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        for item in 0..<3 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 5 + CGFloat(item * 120),
                                     y: size.height / 2)
            addChild(findIt)
            positions.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        ball = SKSpriteNode(imageNamed: DartsImageName.pinkBall.rawValue)
        ball.name = "ball"
        ball.size = CGSize(width: 40,
                            height: 40)
        ball.position = CGPoint(x: size.width / 2,
                                y: size.height / 1.7)
        addChild(ball)
        
        let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
        ball.run(moveAction) {
            self.ball.isHidden = true
        }
    }
    
    func fourthLevel() {
        for item in 0..<3 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 5 + CGFloat(item * 120),
                                     y: size.height / 3)
            addChild(findIt)
            positions4.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions4.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions4[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        for item in 0..<3 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 5 + CGFloat(item * 120),
                                     y: size.height / 2)
            addChild(findIt)
            positions.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        ball = SKSpriteNode(imageNamed: DartsImageName.pinkBall.rawValue)
        ball.name = "ball"
        ball.size = CGSize(width: 40,
                            height: 40)
        ball.position = CGPoint(x: size.width / 2,
                                y: size.height / 1.7)
        addChild(ball)
        
        let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
        ball.run(moveAction) {
            self.ball.isHidden = true
        }
    }
    
    func fifthLevel() {
        for item in 0..<1 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 1.24,
                                      y: size.height / 1.5)
            addChild(findIt)
            positions5.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions5.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions5[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        for item in 0..<3 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 5 + CGFloat(item * 120),
                                     y: size.height / 3)
            addChild(findIt)
            positions4.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions4.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions4[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        for item in 0..<3 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 5 + CGFloat(item * 120),
                                     y: size.height / 2)
            addChild(findIt)
            positions.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        ball = SKSpriteNode(imageNamed: DartsImageName.pinkBall.rawValue)
        ball.name = "ball"
        ball.size = CGSize(width: 40,
                            height: 40)
        ball.position = CGPoint(x: size.width / 2,
                                y: size.height / 1.7)
        addChild(ball)
        
        let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
        ball.run(moveAction) {
            self.ball.isHidden = true
        }
    }
    
    func sixthLevel() {
        for item in 0..<2 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 2 + CGFloat(item * 120),
                                      y: size.height / 1.5)
            addChild(findIt)
            positions6.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions6.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions6[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        for item in 0..<3 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 5 + CGFloat(item * 120),
                                     y: size.height / 3)
            addChild(findIt)
            positions4.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions4.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions4[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        for item in 0..<3 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 5 + CGFloat(item * 120),
                                     y: size.height / 2)
            addChild(findIt)
            positions.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        ball = SKSpriteNode(imageNamed: DartsImageName.pinkBall.rawValue)
        ball.name = "ball"
        ball.size = CGSize(width: 40,
                            height: 40)
        ball.position = CGPoint(x: size.width / 2,
                                y: size.height / 1.7)
        addChild(ball)
        
        let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
        ball.run(moveAction) {
            self.ball.isHidden = true
        }
    }
    
    func sevethLevel() {
        for item in 0..<3 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 5 + CGFloat(item * 120),
                                      y: size.height / 1.5)
            addChild(findIt)
            positions7.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions7.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions7[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        for item in 0..<3 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 5 + CGFloat(item * 120),
                                     y: size.height / 3)
            addChild(findIt)
            positions4.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions4.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions4[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        for item in 0..<3 {
            let findIt = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.findIt.rawValue))
            findIt.zPosition = 2
            findIt.name = "findIt"
            findIt.size = CGSize(width: 80,
                                height: 100)
            findIt.position = CGPoint(x: size.width / 5 + CGFloat(item * 120),
                                     y: size.height / 2)
            addChild(findIt)
            positions.append(findIt.position)
           
            
            let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                let moveBall = SKAction.move(to: self.positions.randomElement()!, duration: 1)
                self.ball.run(moveBall)
                findIt.run(moveAction) {
                    let moveAction = SKAction.move(to: self.positions[item], duration: 1)
                    findIt.run(moveAction) {
                        self.ball.isHidden = false
                    }
                }
            }
        }
        
        ball = SKSpriteNode(imageNamed: DartsImageName.pinkBall.rawValue)
        ball.name = "ball"
        ball.size = CGSize(width: 40,
                            height: 40)
        ball.position = CGPoint(x: size.width / 2,
                                y: size.height / 1.7)
        addChild(ball)
        
        let moveAction = SKAction.move(to: CGPoint(x: size.width / 2, y: size.height / 2), duration: 1)
        ball.run(moveAction) {
            self.ball.isHidden = true
        }
    }
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        physicsWorld.contactDelegate = self
        setupView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
         let location = touch.location(in: self)
         guard let tappedNode = nodes(at: location).first else { return }
         if tappedNode.name == "findIt" {
            if nodes(at: tappedNode.position).contains(where: { $0.name == "ball" && $0 !== tappedNode }) {
                game!.isWin = true
                UserDefaultsManager().completeFind()
            } else {
                game!.isLose = true
            }
        }
    }
}

struct DartsFindView: View {
    @StateObject var dartsFindModel =  DartsFindViewModel()
    @StateObject var gameModel =  GameModel()
    @ObservedObject var router: _RTR
    
    var body: some View {
        ZStack {
            SpriteView(scene: dartsFindModel.createFindGameScene(gameData: gameModel))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            
            if gameModel.isWin {
                DartsFindWinView(router: router)
            }
            
            if gameModel.isLose {
                DartsFindLoseView(router: router)
            }
        }
    }
}

#Preview {
    @ObservedObject var router = _RTR()
    return DartsFindView(router: router)
}


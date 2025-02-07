import SwiftUI
import SpriteKit

extension dgso {
    func setupView() {
        let gameBackground = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.dartsGameBackground.rawValue))
        gameBackground.size = CGSize(width: size.width, height: size.height)
        gameBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameBackground)
        
        let pauseBackground = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.roundBackground.rawValue))
        pauseBackground.size = CGSize(width: frame.size.width * 0.15,
                                      height: frame.size.width * 0.15)
        pauseBackground.position = CGPoint(x: size.width / 8,
                                           y: size.height / 1.14)
        addChild(pauseBackground)
        
        let pause = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.pause.rawValue))
        pause.size = CGSize(width: frame.size.width * 0.06,
                            height: frame.size.height * 0.03)
        pause.position = CGPoint(x: size.width / 8.1,
                                 y: size.height / 1.14)
        addChild(pause)
        
        let backForLevelLabel = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.backButton.rawValue))
        backForLevelLabel.size = CGSize(width: 90,
                                        height: 60)
        backForLevelLabel.position = CGPoint(x: size.width / 3,
                                             y: size.height / 1.14)
        addChild(backForLevelLabel)
        
        let levelLabel = SKLabelNode(fontNamed: ("SpicyRice-Regular"))
        levelLabel.text = "LEVEL"
        levelLabel.fontColor = .purple
        levelLabel.fontSize = 24
        levelLabel.position = CGPoint(x: size.width / 3,
                                      y: size.height / 1.14)
        addChild(levelLabel)
        
        let numberOfLevel = SKLabelNode(fontNamed: ("SpicyRice-Regular"))
        numberOfLevel.text = "\(UserDefaultsManager.defaults.object(forKey: Keys.numberOfLevel.rawValue)!)"
        numberOfLevel.fontColor = .purple
        numberOfLevel.fontSize = 24
        numberOfLevel.position = CGPoint(x: size.width / 3,
                                         y: size.height / 1.176)
        addChild(numberOfLevel)
        
        let backForTimeLabel = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.backButton.rawValue))
        backForTimeLabel.size = CGSize(width: 90,
                                       height: 60)
        backForTimeLabel.position = CGPoint(x: size.width / 1.7,
                                            y: size.height / 1.14)
        addChild(backForTimeLabel)
        
        let timeLabel = SKLabelNode(fontNamed: ("SpicyRice-Regular"))
        timeLabel.text = "TIME"
        timeLabel.fontColor = .purple
        timeLabel.fontSize = 22
        timeLabel.position = CGPoint(x: size.width / 1.7,
                                     y: size.height / 1.137)
        addChild(timeLabel)
        
        timeLeft = SKLabelNode(fontNamed: ("SpicyRice-Regular"))
        timeLeft.text = "00:30"
        timeLeft.fontColor = .purple
        timeLeft.fontSize = 24
        timeLeft.position = CGPoint(x: size.width / 1.7,
                                    y: size.height / 1.176)
        addChild(timeLeft)
        
        let backForLifesLabel = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.backButton.rawValue))
        backForLifesLabel.size = CGSize(width: 90,
                                        height: 60)
        backForLifesLabel.position = CGPoint(x: size.width / 1.19,
                                             y: size.height / 1.14)
        addChild(backForLifesLabel)
        
        let heart1 = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.heart.rawValue))
        heart1.size = CGSize(width: 25,
                             height: 25)
        heart1.position = CGPoint(x: size.width / 1.29,
                                  y: size.height / 1.14)
        addChild(heart1)
        
        heart2 = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.heart.rawValue))
        heart2.size = CGSize(width: 25,
                             height: 25)
        heart2.position = CGPoint(x: size.width / 1.19,
                                  y: size.height / 1.14)
        addChild(heart2)
        
        heart3 = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.heart.rawValue))
        heart3.size = CGSize(width: 25,
                             height: 25)
        heart3.position = CGPoint(x: size.width / 1.101,
                                  y: size.height / 1.14)
        addChild(heart3)
        
        let backgroundForTools = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.backgroundForTools.rawValue))
        backgroundForTools.size = CGSize(width: 105,
                                         height: 210)
        backgroundForTools.position = CGPoint(x: size.width / 6.5,
                                              y: size.height / 5.8)
        addChild(backgroundForTools)
        
        let timeFrezeeTool = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.timeFreezItem.rawValue))
        timeFrezeeTool.size = CGSize(width: 85,
                                     height: 85)
        timeFrezeeTool.position = CGPoint(x: size.width / 7,
                                          y: size.height / 4.2)
        addChild(timeFrezeeTool)
        
        let countOfFreezeToolBack = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.volumePin.rawValue))
        countOfFreezeToolBack.size = CGSize(width: 30,
                                            height: 30)
        countOfFreezeToolBack.position = CGPoint(x: size.width / 4.5,
                                                 y: size.height / 5)
        addChild(countOfFreezeToolBack)
        
        let zoomTool = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.reduseSizeDartsItem.rawValue))
        zoomTool.size = CGSize(width: 85,
                               height: 85)
        zoomTool.position = CGPoint(x: size.width / 6,
                                    y: size.height / 8.2)
        addChild(zoomTool)
        
        let countOfZoomToolBack = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.volumePin.rawValue))
        countOfZoomToolBack.size = CGSize(width: 30,
                                          height: 30)
        countOfZoomToolBack.position = CGPoint(x: size.width / 4.5,
                                               y: size.height / 12)
        addChild(countOfZoomToolBack)
        
        let zoomToolCount = SKLabelNode(fontNamed: ("SpicyRice-Regular"))
        zoomToolCount.text = "1"
        zoomToolCount.fontColor = UIColor(cgColor: CGColor(red: 249/255, green: 147/255, blue: 254/255, alpha: 1))
        zoomToolCount.fontSize = 18
        zoomToolCount.position = CGPoint(x: size.width / 4.58,
                                         y: size.height / 13.3)
        addChild(zoomToolCount)
        
        let freezeToolCount = SKLabelNode(fontNamed: ("SpicyRice-Regular"))
        freezeToolCount.text = "2"
        freezeToolCount.fontColor = UIColor(cgColor: CGColor(red: 249/255, green: 147/255, blue: 254/255, alpha: 1))
        freezeToolCount.fontSize = 18
        freezeToolCount.position = CGPoint(x: size.width / 4.5,
                                           y: size.height / 5.22)
        addChild(freezeToolCount)
        
        arrow = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.arrow.rawValue))
        arrow.name = "arrow"
        arrow.size = CGSize(width: frame.size.width * 0.638,
                            height: frame.size.height * 0.318)
        arrow.position = CGPoint(x: size.width / 2,
                                 y: size.height / 18)
        arrow.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 200))
        arrow.physicsBody?.affectedByGravity = false
        arrow.physicsBody?.isDynamic = true
        arrow.physicsBody?.categoryBitMask = asd211212.arrow
        arrow.physicsBody?.contactTestBitMask = asd211212.goalBall | asd211212.ball
        addChild(arrow)
        
        let pinkBall = SKSpriteNode(imageNamed: DartsImageName.pinkBall.rawValue)
        pinkBall.size = CGSize(width: 70,
                               height: 70)
        pinkBall.position = CGPoint(x: size.width / 2,
                                    y: size.height / 1.6)
        pinkBall.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 70, height: 70))
        pinkBall.physicsBody?.isDynamic = false
        pinkBall.physicsBody?.categoryBitMask = asd211212.goalBall
        pinkBall.physicsBody?.contactTestBitMask = asd211212.arrow
        addChild(pinkBall)
        
        let ball1 = SKSpriteNode(imageNamed: DartsImageName.grayBall.rawValue)
        ball1.size = CGSize(width: 50,
                            height: 50)
        ball1.position = getLevel().randomElement()?[0] ?? CGPoint(x: 0, y: 0)
        ball1.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 70, height: 70))
        ball1.physicsBody?.isDynamic = false
        ball1.physicsBody?.categoryBitMask = asd211212.ball
        ball1.physicsBody?.contactTestBitMask = asd211212.arrow
        addChild(ball1)
        
        let ball2 = SKSpriteNode(imageNamed: DartsImageName.grayBall.rawValue)
        ball2.size = CGSize(width: 50,
                            height: 50)
        ball2.position = getLevel().randomElement()?[1] ?? CGPoint(x: 0, y: 0)
        ball2.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 70, height: 70))
        ball2.physicsBody?.isDynamic = false
        ball2.physicsBody?.categoryBitMask = asd211212.ball
        ball2.physicsBody?.contactTestBitMask = asd211212.arrow
        addChild(ball2)
        
        let ball3 = SKSpriteNode(imageNamed: DartsImageName.grayBall.rawValue)
        ball3.size = CGSize(width: 50,
                            height: 50)
        ball3.position = getLevel().randomElement()?[2] ?? CGPoint(x: 0, y: 0)
        ball3.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 70, height: 70))
        ball3.physicsBody?.isDynamic = false
        ball3.physicsBody?.categoryBitMask = asd211212.ball
        ball3.physicsBody?.contactTestBitMask = asd211212.arrow
        addChild(ball3)
        
        let ball4 = SKSpriteNode(imageNamed: DartsImageName.grayBall.rawValue)
        ball4.size = CGSize(width: 50,
                            height: 50)
        ball4.position = getLevel().randomElement()?[3] ?? CGPoint(x: 0, y: 0)
        ball4.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 70, height: 70))
        ball4.physicsBody?.isDynamic = false
        ball4.physicsBody?.categoryBitMask = asd211212.ball
        ball4.physicsBody?.contactTestBitMask = asd211212.arrow
        addChild(ball4)
        
        let ball5 = SKSpriteNode(imageNamed: DartsImageName.grayBall.rawValue)
        ball5.size = CGSize(width: 50,
                            height: 50)
        ball5.position = getLevel().randomElement()?[4] ?? CGPoint(x: 0, y: 0)
        ball5.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 70, height: 70))
        ball5.physicsBody?.isDynamic = false
        ball5.physicsBody?.categoryBitMask = asd211212.ball
        ball5.physicsBody?.contactTestBitMask = asd211212.arrow
                addChild(ball5)
    }
    
    func getLevel() -> [[CGPoint]] {
        let firstLevel: [CGPoint] = [CGPoint(x: size.width / 1.8,
                                             y: size.height / 1.33),
                                     CGPoint(x: -1000,
                                             y: -1000),
                                     CGPoint(x: -1000,
                                             y: -1000),
                                     CGPoint(x: -1000,
                                             y: -1000),
                                     CGPoint(x: -1000,
                                             y: -1000)]
        
        let secondLevel: [CGPoint] = [CGPoint(x: size.width / 1.8,
                                             y: size.height / 1.33),
                                     CGPoint(x: size.width / 2.1,
                                             y: size.height / 2.1),
                                     CGPoint(x: -1000,
                                             y: -1000),
                                     CGPoint(x: -1000,
                                             y: -1000),
                                     CGPoint(x: -1000,
                                             y: -1000)]
        
        let thirdLevel: [CGPoint] = [CGPoint(x: size.width / 1.8,
                                             y: size.height / 1.33),
                                     CGPoint(x: size.width / 2.1,
                                             y: size.height / 2.1),
                                     CGPoint(x: size.width / 1.3,
                                             y: size.height / 1.65),
                                     CGPoint(x: -1000,
                                             y: -1000),
                                     CGPoint(x: -1000,
                                             y: -1000)]
        
        let fourthLevel: [CGPoint] = [CGPoint(x: size.width / 1.8,
                                             y: size.height / 1.33),
                                     CGPoint(x: size.width / 2.1,
                                             y: size.height / 2.1),
                                     CGPoint(x: size.width / 1.3,
                                             y: size.height / 1.65),
                                      CGPoint(x: size.width / 5,
                                              y: size.height / 1.7),
                                     CGPoint(x: -1000,
                                             y: -1000)]
        
        let fifthLevel: [CGPoint] = [CGPoint(x: size.width / 1.8,
                                             y: size.height / 1.33),
                                     CGPoint(x: size.width / 1.7,
                                             y: size.height / 2.1),
                                     CGPoint(x: size.width / 1.3,
                                             y: size.height / 1.65),
                                     CGPoint(x: size.width / 4,
                                             y: size.height / 1.9),
                                     CGPoint(x: size.width / 4,
                                             y: size.height / 1.4)]
        
        let sixthLevel: [CGPoint] = [CGPoint(x: size.width / 2,
                                             y: size.height / 1.35),
                                     CGPoint(x: size.width / 2,
                                             y: size.height / 1.95),
                                     CGPoint(x: size.width / 1.4,
                                             y: size.height / 1.59),
                                     CGPoint(x: size.width / 4,
                                             y: size.height / 1.39),
                                     CGPoint(x: -1000,
                                             y: -1000)]
        
        let seventhLevel: [CGPoint] = [CGPoint(x: size.width / 1.7,
                                               y: size.height / 1.34),
                                       CGPoint(x: size.width / 1.7,
                                               y: size.height / 1.95),
                                       CGPoint(x: size.width / 1.4,
                                               y: size.height / 1.59),
                                       CGPoint(x: size.width / 2.7,
                                               y: size.height / 1.34),
                                       CGPoint(x: -1000,
                                               y: -1000)]
        
        return [firstLevel, secondLevel, thirdLevel, fourthLevel, fifthLevel, sixthLevel, seventhLevel]
    }
    
    func moveArrow(touchLocation: CGPoint) {
        let dx = touchLocation.x - arrow.position.x
        let dy = touchLocation.y - arrow.position.y
        let angle = atan2(dy, dx)
        let adjustedAngle = angle - .pi / 2
        arrow.zRotation = adjustedAngle
        
        let moveAction = SKAction.move(by: CGVector(dx: cos(angle) * 1000, dy: sin(angle) * 1000), duration: 1)
        game?.isArrowInFlight = true
        arrow.run(moveAction) {
            self.game?.isArrowInFlight = false
        }
    }
    
    func isArrowOutOfBounds() -> Bool {
        return arrow.position.x < 0 || arrow.position.x > size.width ||
        arrow.position.y < 0 || arrow.position.y > size.height
    }
    
    func resetArrow() {
        arrow.removeFromParent()
        arrow = SKSpriteNode(imageNamed: DartsImageName.arrow.rawValue)
        arrow.name = "arrow"
        arrow.size = CGSize(width: frame.size.width * 0.638,
                            height: frame.size.height * 0.318)
        arrow.position = CGPoint(x: size.width / 2,
                                 y: size.height / 18)
        arrow.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 200))
        arrow.physicsBody?.affectedByGravity = false
        arrow.physicsBody?.isDynamic = true
        arrow.physicsBody?.categoryBitMask = asd211212.arrow
        arrow.physicsBody?.contactTestBitMask = asd211212.goalBall | asd211212.ball
        addChild(arrow)
        game?.isArrowInFlight = false
        
    }
    
    func changeHeartImages() {
        game?.countOfMiss += 1
        if game?.countOfMiss == 1 {
            heart3.texture = SKTexture(imageNamed: DartsImageName.emptyHeart.rawValue)
        }
        
        if game?.countOfMiss == 2 {
            heart2.texture = SKTexture(imageNamed: DartsImageName.emptyHeart.rawValue)
        }
        
        if game?.countOfMiss == 3 {
            game?.isLose = true
            timer?.invalidate()
        }
    }
    
    func shootedGrayBall(node: SKNode?) {
        arrow.removeAllActions()
        resetArrow()
        changeHeartImages()
        node?.removeFromParent()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateTimer()
        }
    }
    
    func updateTimer() {
        if game?.timeLeft ?? 0 > 0 {
            game?.timeLeft -= 1
            timeLeft.text = "\(String(describing: game!.timeLeft / 60)):\(String(describing: game!.timeLeft % 60))"
        } else {
            if game!.isWin != true {
                game?.isLose = true
                timer?.invalidate()
            }
        }
    }
}

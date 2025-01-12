import SwiftUI
import SpriteKit

extension DartsGrabGameSpriteKit {
    func toKnowPhoneSize() -> CGFloat {
        var isSmall: CGFloat = 0
        
        if UIScreen.main.bounds.height > 680 {
            isSmall = 608
        } else {
            isSmall = 477
        }
        
        return isSmall
    }
    
    func setupView() {
        let gameBackground = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.grabBG.rawValue))
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
        
        let backForTimeLabel = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.backButton.rawValue))
        backForTimeLabel.size = CGSize(width: 90,
                                       height: 60)
        backForTimeLabel.position = CGPoint(x: size.width / 2,
                                            y: size.height / 1.14)
        addChild(backForTimeLabel)
        
        let timeLabel = SKLabelNode(fontNamed: ("SpicyRice-Regular"))
        timeLabel.text = "TIME"
        timeLabel.fontColor = .purple
        timeLabel.fontSize = 22
        timeLabel.position = CGPoint(x: size.width / 2,
                                     y: size.height / 1.137)
        addChild(timeLabel)
        
        timeLeft = SKLabelNode(fontNamed: ("SpicyRice-Regular"))
        timeLeft.text = "\(String(describing: game!.timeLeft / 60)):\(String(describing: game!.timeLeft % 60))"
        timeLeft.fontColor = .purple
        timeLeft.fontSize = 24
        timeLeft.position = CGPoint(x: size.width / 2,
                                    y: size.height / 1.176)
        addChild(timeLeft)
        
        let bottom = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.bottom.rawValue))
        bottom.size = CGSize(width: size.width * 0.9,
                             height: size.height * 0.3)
        bottom.position = CGPoint(x: size.width / 2,
                                  y: size.height / 6.8)
        addChild(bottom)
        
        let middle = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.middle.rawValue))
        middle.size = CGSize(width: size.width * 0.915,
                             height: size.height * 0.07)
        middle.position = CGPoint(x: size.width / 2,
                                  y: size.height / 3.78)
        addChild(middle)
        
        let top = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.top.rawValue))
        top.size = CGSize(width: size.width * 0.8,
                          height: size.height * 0.5)
        top.position = CGPoint(x: size.width / 2.02,
                               y: size.height / 1.85)
        addChild(top)
        
        let bottomPlatform = SKShapeNode(rectOf: CGSize(width: 250, height: 30))
        bottomPlatform.fillColor = .clear
        bottomPlatform.strokeColor = .clear
        bottomPlatform.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: bottomPlatform.frame.width, height: bottomPlatform.frame.height))
        bottomPlatform.physicsBody?.isDynamic = false
        bottomPlatform.position = CGPoint(x: size.width / 2.02,
                                          y: size.height / 3.2)
        addChild(bottomPlatform)
        
        let leftPlatform = SKShapeNode(rectOf: CGSize(width: 30, height: 150))
        leftPlatform.fillColor = .clear
        leftPlatform.strokeColor = .clear
        leftPlatform.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leftPlatform.frame.width, height: leftPlatform.frame.height))
        leftPlatform.physicsBody?.isDynamic = false
        leftPlatform.position = CGPoint(x: size.width / 7.3,
                                        y: size.height / 2.4)
        addChild(leftPlatform)
        
        let rightPlatform = SKShapeNode(rectOf: CGSize(width: 30, height: 150))
        rightPlatform.fillColor = .clear
        rightPlatform.strokeColor = .clear
        rightPlatform.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: rightPlatform.frame.width, height: rightPlatform.frame.height))
        rightPlatform.physicsBody?.isDynamic = false
        rightPlatform.position = CGPoint(x: size.width / 1.17,
                                         y: size.height / 2.4)
        addChild(rightPlatform)
        
        wire = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.wireToHand.rawValue))
        wire.size = CGSize(width: size.width * 0.45,
                           height: size.height * 0.035)
        wire.position = CGPoint(x: size.width / 1.7,
                                y: size.height / 1.44)
        addChild(wire)
        
        let handFirstPart = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.hand1part.rawValue))
        handFirstPart.size = CGSize(width: size.width * 0.05,
                                    height: size.height * 0.035)
        
        handSecondPart = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.hand2part.rawValue))
        handSecondPart.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 20, height: 20))
        handSecondPart.physicsBody?.isDynamic = false
        handSecondPart.physicsBody?.affectedByGravity = false
        handSecondPart.size = CGSize(width: size.width * 0.07,
                                     height: size.height * 0.035)
        handSecondPart.position.y = -30
        
        leftSideHand = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.leftPart.rawValue))
        leftSideHand.size = CGSize(width: size.width * 0.05,
                                   height: size.height * 0.035)
        leftSideHand.position.y = -25
        leftSideHand.position.x = -12
        leftSideHand.isHidden = true
        
        rightSideHand = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.rightPart.rawValue))
        rightSideHand.size = CGSize(width: size.width * 0.05,
                                    height: size.height * 0.038)
        rightSideHand.position.y = -25
        rightSideHand.position.x = 12
        rightSideHand.isHidden = true
        
        handLayer = SKNode()
        handLayer.name = "handLayer"
        handLayer.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 50))
        handLayer.physicsBody?.isDynamic = false
        handLayer.physicsBody?.categoryBitMask = CBitMaskGrab.grab
        handLayer.physicsBody?.contactTestBitMask = CBitMaskGrab.ball | CBitMaskGrab.obstacle
        handLayer.addChild(handFirstPart)
        handLayer.addChild(handSecondPart)
        handLayer.addChild(leftSideHand)
        handLayer.addChild(rightSideHand)
        
        handLayer.position = CGPoint(x: size.width / 2.95,
                                     y: size.height / 1.44)
        addChild(handLayer)
        
        let constraint = SKConstraint.positionX(SKRange(lowerLimit: size.width * 0.205,
                                                        upperLimit: size.width * 0.789))
        let constraintY = SKConstraint.positionY(SKRange(lowerLimit: size.height / 2.8,
                                                         upperLimit: size.height * 1))
        let wireConstraint = SKConstraint.positionX(SKRange(lowerLimit: size.width * 0.405,
                                                            upperLimit: size.width * 0.589))
        handLayer.constraints = [constraint, constraintY]
        wire.constraints = [wireConstraint]
        
        let leftButton = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.backArrowCurly.rawValue))
        leftButton.size = CGSize(width: size.width * 0.08,
                                 height: size.height * 0.055)
        leftButton.name = "left"
        leftButton.position = CGPoint(x: size.width / 5.2,
                                      y: size.height / 3.64)
        addChild(leftButton)
        
        let rightButton = SKSpriteNode(texture: SKTexture(imageNamed: DartsImageName.nextArrow.rawValue))
        rightButton.size = CGSize(width: size.width * 0.08,
                                  height: size.height * 0.055)
        rightButton.name = "right"
        rightButton.position = CGPoint(x: size.width / 2.6,
                                       y: size.height / 3.64)
        addChild(rightButton)
        
        let grabButton = SKSpriteNode(color: .clear, size: CGSize(width: 30, height: 20))
        grabButton.name = "grab"
        grabButton.position = CGPoint(x: size.width / 1.25,
                                      y: size.height / 3.64)
        addChild(grabButton)
        
        createBalls()

        
        wireStright = SKSpriteNode(color: .gray, size: CGSize(width: 5, height: 0))
        wireStright.position = CGPoint(x: handLayer.position.x, y: toKnowPhoneSize())
        self.addChild(wireStright)
    }
    
    func grab() {
        let moveDown = SKAction.moveTo(y: size.height / 2.6, duration: 2)
        let moveUp = SKAction.moveTo(y: size.height / 1.44, duration: 3)
        
        handSecondPart.isHidden = true
        leftSideHand.isHidden = false
        rightSideHand.isHidden = false
        game?.isGrabingDown = true
        
        let sequence = SKAction.sequence([moveUp])
        handLayer?.run(moveDown, completion: {
            self.leftSideHand.isHidden = true
            self.rightSideHand.isHidden = true
            self.handSecondPart.isHidden = false
            self.game?.isGrabingDown = false
            self.game?.isGrabingUp = true
            self.handLayer.run(sequence, completion: {
                self.game?.isGrabingUp = false
                if self.game?.text != "bomb" {
                    self.game?.isWin = true
                } else {
                    self.game?.isLose = true
                }
            })
        })
    }
    
    func move(to: CGFloat) {
        handLayer.run(SKAction.repeatForever(SKAction.sequence([
            SKAction.moveBy(x: to, y: 0, duration: 0.1),
            SKAction.wait(forDuration: 0.01)
        ])))
    }
    
    func createBalls() {
        for i in 0..<22 {
            let randomValues = ["1", "2", "4", "5"]
            let labelNode = SKLabelNode(fontNamed: "SpicyRice-Regular")
            labelNode.text = "\(randomValues.randomElement() ?? "")X"
            labelNode.fontSize = 8
            labelNode.fontColor = .yellow
            labelNode.position = CGPoint(x: 0, y: -3)
            
            let sprite = SKSpriteNode(imageNamed: "orangeBall")
            sprite.position = CGPoint(x: 90 + CGFloat(i) * 10, y: 290)
            sprite.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            sprite.physicsBody?.isDynamic = true
            sprite.physicsBody?.affectedByGravity = true
            sprite.size = CGSize(width: 20, height: 20)
            sprite.physicsBody?.categoryBitMask = CBitMaskGrab.ball
            sprite.physicsBody?.contactTestBitMask = CBitMaskGrab.grab
            
            sprite.addChild(labelNode)
            self.addChild(sprite)
            
        }
        
        for i in 0..<4 {
            let labelNode = SKLabelNode(fontNamed: "SpicyRice-Regular")
            labelNode.text = "bombX"
            labelNode.fontSize = 8
            labelNode.fontColor = .clear
            labelNode.position = CGPoint(x: 0, y: -3)
            
            let sprite = SKSpriteNode(imageNamed: "bomb")
            sprite.position = CGPoint(x: 90 + CGFloat(i) * 60, y: 290)
            sprite.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            sprite.physicsBody?.isDynamic = true
            sprite.physicsBody?.affectedByGravity = true
            sprite.size = CGSize(width: 20, height: 20)
            sprite.physicsBody?.categoryBitMask = CBitMaskGrab.ball
            sprite.physicsBody?.contactTestBitMask = CBitMaskGrab.grab
            sprite.addChild(labelNode)
            self.addChild(sprite)
        }
        
        for i in 0..<4 {
            let labelNode = SKLabelNode(fontNamed: "SpicyRice-Regular")
            labelNode.text = "10X"
            labelNode.fontSize = 8
            labelNode.fontColor = .red
            labelNode.position = CGPoint(x: 0, y: -3)
            
            let sprite = SKSpriteNode(imageNamed: "yellowBall")
            sprite.position = CGPoint(x: 90 + CGFloat(i) * 60, y: 290)
            sprite.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            sprite.physicsBody?.isDynamic = true
            sprite.physicsBody?.affectedByGravity = true
            sprite.size = CGSize(width: 20, height: 20)
            sprite.physicsBody?.categoryBitMask = CBitMaskGrab.ball
            sprite.physicsBody?.contactTestBitMask = CBitMaskGrab.grab
            sprite.addChild(labelNode)
            self.addChild(sprite)
        }
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
    
    func getDownWire() {
        wireStright.position.x = handLayer.position.x
        if game?.isGrabingDown == true {
            if game?.isGrabingDown == true {
                wireStright.size.height += 2.2
                wireStright.position.y = toKnowPhoneSize() - (wireStright.size.height / 2)
            }
        }
    }
    
    func getUpWire() {
        wireStright.position.x = handLayer.position.x
        if game?.isGrabingUp == true {
            if game?.isGrabingUp == true {
                wireStright.size.height -= 1.47
                wireStright.position.y = toKnowPhoneSize() - (wireStright.size.height / 2)
            }
        }
    }
}

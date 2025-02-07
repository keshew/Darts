import SwiftUI
import SpriteKit

class dgso: SKScene, SKPhysicsContactDelegate {
    var game: ga?
    var arrow: SKSpriteNode!
    var heart2: SKSpriteNode!
    var heart3: SKSpriteNode!
    var timeLeft : SKLabelNode!
    var timer: Timer?
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        physicsWorld.contactDelegate = self
        setupView()
        startTimer()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if isArrowOutOfBounds() {
            resetArrow()
            changeHeartImages()
        }
        
        if let isWin = game?.isWin {
            if isWin == true {
                timer?.invalidate()
            }
        }
        
        if let isLose = game?.isLose {
            if isLose == true {
                timer?.invalidate()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if game!.isArrowInFlight { return }
        for touch in touches {
            let touchLocation = touch.location(in: self)
            moveArrow(touchLocation: touchLocation)
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        if bodyA.node?.name == "arrow" && bodyB.node?.physicsBody?.categoryBitMask == asd211212.ball || bodyB.node?.name == "arrow" && bodyA.node?.physicsBody?.categoryBitMask == asd211212.ball {
            shootedGrayBall(node:  bodyB.node?.physicsBody?.node)
        }
        
        if bodyA.node?.name == "arrow" && bodyB.node?.physicsBody?.categoryBitMask == asd211212.goalBall || bodyB.node?.name == "arrow" && bodyA.node?.physicsBody?.categoryBitMask == asd211212.goalBall {
            arrow.removeAllActions()
            game?.isWin = true
        }
    }
}

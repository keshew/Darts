import SwiftUI
import SpriteKit

class lkojvccn: SKScene, SKPhysicsContactDelegate {
    var game: dgdgmv?
    var timeLeft : SKLabelNode!
    var handLayer: SKNode!
    var wire: SKSpriteNode!
    var rightSideHand: SKSpriteNode!
    var leftSideHand: SKSpriteNode!
    var handSecondPart: SKSpriteNode!
    var platform: SKSpriteNode!
    var timer: Timer?
    var wireStright: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        physicsWorld.contactDelegate = self
        setupView()
        startTimer()
    }
    
    override func update(_ currentTime: TimeInterval) {
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
     
        getDownWire()
        getUpWire()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode, tappedNode.name == "left" && !game!.isGrabingDown && !game!.isGrabingUp {
                game?.isMovingLeft = false
                handLayer.removeAllActions()
            }
            
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode, tappedNode.name == "right" && !game!.isGrabingDown && !game!.isGrabingUp {
                game?.isMovingRight = false
                handLayer.removeAllActions()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.location(in: self)
            
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode, tappedNode.name == "left" && !game!.isGrabingDown && !game!.isGrabingUp {
                game?.isMovingLeft = true
                move(to: -5)
            }
            
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode, tappedNode.name == "right" && !game!.isGrabingDown && !game!.isGrabingUp  {
                game?.isMovingRight = true
                move(to: 5)
            }
            
            if let tappedNode = self.atPoint(touchLocation) as? SKSpriteNode, tappedNode.name == "grab" && !game!.isGrabingDown && !game!.isGrabingUp {
                if !game!.isMovingLeft || !game!.isMovingRight {
                    grab()
                }
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        var targetBody: SKPhysicsBody?
        
        if bodyA.node?.parent == handLayer {
            targetBody = bodyB
        } else if bodyB.node?.parent == handLayer {
            targetBody = bodyA
        }
        
        if let targetBody = targetBody, let targetNode = targetBody.node, !game!.isNodeAdded, targetBody.node?.name != "handLayer" {
            targetNode.removeFromParent()
            for child in targetNode.children {
                if let labelNode = child as? SKLabelNode {
                    var text = labelNode.text
                    text?.removeLast()
                    game?.text = text ?? ""
                }
            }
            targetNode.position = CGPoint(x: 0, y: -35)
            handLayer.addChild(targetNode)
            targetBody.isDynamic = false
            game?.isNodeAdded = true
        }
    }
}

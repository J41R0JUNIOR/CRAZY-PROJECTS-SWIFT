//
//  GameScene.swift
//  aa
//
//  Created by Jairo Júnior on 20/07/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    //zombie
    var player = SKSpriteNode(texture: SKTexture(imageNamed: "player"))
    var currentPlayer = 1
    
//    let joystickBack = SKSpriteNode(imageNamed: "JoyBack")
//    let joystickButton = SKSpriteNode(imageNamed: "JoyButton")
    
    //joystick boddy
    let joystickBack = SKSpriteNode(imageNamed: "JoyBack")
    
    let joystickButton = SKSpriteNode(imageNamed: "JoyButton")
    
    //to know when it's being used
    var joystickInUse = false
    
    //to calculate the velocity X and Y though
    var velocityX:CGFloat = 0.0
    var velocityY:CGFloat = 0.0
    
    
    override func didMove(to view: SKView) {
        //to hide the joystick
        joystickBack.isHidden = false
        joystickButton.isHidden = false
        
        //to chose the inicial position of the Joystick
        /*
        self.joystickBack.position = CGPoint(x: self.frame.midX , y: self.frame.midY - 200)
        self.joystickButton.position = CGPoint(x: self.frame.midX , y: self.frame.midY - 200)
         */
        
        //adding then to the view
        self.addChild(joystickBack)
        self.addChild(joystickButton)
        
        self.player.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(player)
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(touch: UITouch) {
        
        //get the lovation of the touch
        let location = touch.location(in: self)
        
        //if joystick is in use we can calculate the scope betwen inicial touch and final touch
        if joystickInUse{
            
            //gettin the vector of the Joystick label to don't let the Joystick Button out of the scope
            let vector = CGVector(dx: location.x - joystickBack.position.x, dy: location.y - joystickBack.position.y)
            
            //calculating the angle of the joystickBack
            let angle = atan2(vector.dy, vector.dx)
            
            //distance of the angle from center of the joystickback
            let distanceFromCenter = CGFloat(joystickBack.frame.size.height/2)
            
            //calculating the distance from center
            let distanceX = CGFloat(sin(angle - distanceFromCenter))
            
            let distanceY = CGFloat(cos(angle - distanceFromCenter))
            
            //adding the joystick button at the point we calculated that the user touched
            if joystickBack.frame.contains(location){
                joystickButton.position = location
            }else{
                //if out of bounds it get back to the center of the joystickBack
                joystickButton.position = CGPoint(x: joystickBack.position.x - distanceX, y: joystickBack.position.y - distanceY)
            }
            
            //telling the velocity we want to put according with the point of the joystickButton is inside the JoystickBack
            velocityX = (joystickButton.position.x - joystickBack.position.x) / 5
            //velocityY = (joystickButton.position.y - joystickBack.position.y) / 5
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            //getting location and putting the joystick at this location
            let location = t.location(in: self)
            
            joystickButton.position.x = location.x
            joystickButton.position.y = location.y
            joystickBack.position.x = location.x
            joystickBack.position.y = location.y
            
            //to know when the joystick is been used
            if joystickButton.frame.contains(location){
                joystickInUse = true
            }else{
                joystickInUse = false
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchMoved(touch: t)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if joystickInUse{
            movementOver()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // updating the position of the player according to the joystick
        self.player.position.x += velocityX
        //self.player.position.y += velocityY
        //to change the face side of the player according to the joystick and movimentation
        if velocityX < 0{
            player.xScale = -1
        }
        if velocityX > 0{
            player.xScale = 1
        }
    }
    
    //function to move the joystickButton back to the center of the JoystickBack
    func movementOver(){
        //knowing the joystickBack position center
        let moveBack = SKAction.move(to: CGPoint(x: joystickBack.position.x, y: joystickBack.position.y), duration: TimeInterval(floatLiteral: 0.1))
            //adding animation while returning back to the center
        moveBack.timingMode = .linear
        //moving to the center and letting the velocity and joystickInUse to the inicial stage
        joystickButton.run(moveBack)
        joystickInUse = false
        velocityX = 0
        velocityY = 0
    }
}

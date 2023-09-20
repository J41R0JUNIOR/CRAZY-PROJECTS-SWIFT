import SpriteKit
import GameplayKit

//class GameScene: SKScene {
//    //zombie
//    var player = SKSpriteNode(texture: SKTexture(imageNamed: "player"))
//    var currentPlayer = 1
//
//    //joystick boddy
//    let joystickBack = SKSpriteNode(imageNamed: "JoyBack")
//    let joystickButton = SKSpriteNode(imageNamed: "JoyButton")
//
//    //to know when it's being used
//    var joystickInUse = false
//
//    //to calculate the velocity X and Y though
//    var velocityX: CGFloat = 0.0
//    var velocityY: CGFloat = 0.0
//
//    var joystickTouch: UITouch? // Optional UITouch to store the initial joystick touch
//
//    var cameraNode:SKCameraNode?
//
//    override func didMove(to view: SKView) {
//
//        //background
//        self.backgroundColor = SKColor.white
//
//
//        //player
//        self.player.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
//        self.addChild(player)
//
//
//        //joystick
//        self.joystickBack.position = CGPoint.zero
//        self.joystickBack.position.y -= 400
//        self.joystickButton.position = self.joystickBack.position
//
//        //to hide the joystick
//        joystickBack.isHidden = false
//        joystickButton.isHidden = false
//
//        //camera
//        cameraNode = SKCameraNode() // defining custom camera as level camera
//        self.camera = cameraNode // defining custom camera as level camera
//
//        self.addChild(camera!) // adding camera to scene
//
//        print(self.children)
//
//        self.addChild(joystickBack)
//        self.addChild(joystickButton)
//    }
//
//
//    func touchMoved(touch: UITouch) {
//
//        //get the location of the touch
//        let location = touch.location(in: self)
//
//
//
//        //if joystick is in use we can calculate the scope between the initial touch and final touch
//        if joystickInUse {
//            //get the vector of the Joystick label to not let the Joystick Button out of the scope
//            let vector = CGVector(dx: location.x - joystickBack.position.x, dy: location.y - joystickBack.position.y)
//
//            //calculating the angle of the joystickBack
//            let angle = atan2(vector.dy, vector.dx)
//
//            //distance of the angle from the center of the joystickback
//            let distanceFromCenter = CGFloat(joystickBack.frame.size.height/2)
//
//            //calculating the distance from the center
//            let distanceX = CGFloat(sin(angle - distanceFromCenter))
//            let distanceY = CGFloat(cos(angle - distanceFromCenter))
//
//            //adding the joystick button at the point we calculated that the user touched
//            if joystickBack.frame.contains(location) {
//                joystickButton.position = location
//            } else {
//                //if out of bounds, it gets back to the center of the joystickBack
//                joystickButton.position = CGPoint(x: joystickBack.position.x - distanceX, y: joystickBack.position.y - distanceY)
//            }
//
//            //telling the velocity we want to put according to the point of the joystickButton is inside the JoystickBack
//            velocityX = (joystickButton.position.x - joystickBack.position.x) / 5
//            //velocityY = (joystickButton.position.y - joystickBack.position.y) / 5
//        }
//    }
//
//    func movementOver() {
//        //knowing the joystickBack position center
//        let moveBack = SKAction.move(to: CGPoint(x: joystickBack.position.x, y: joystickBack.position.y), duration: TimeInterval(floatLiteral: 0.1))
//
//        //adding animation while returning back to the center
//        moveBack.timingMode = .linear
//
//        //moving to the center and letting the velocity and joystickInUse to the initial stage
//        joystickButton.run(moveBack)
//        velocityX = 0
//        velocityY = 0
//    }
//
//
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//
//        guard let touch = touches.first else { return }
//
//        let touchLocation = touch.location(in: self)
//
//
//        for touch in touches {
//            //getting location and putting the joystick at this location
//            let location = touch.location(in: self)
//            // Verificar se o toque inicial está dentro do joystickButton e não temos nenhum joystickTouch em andamento
//            if joystickButton.frame.contains(location)  {
//                joystickTouch = touch
//                joystickInUse = true
//            }
//        }
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//
//            //verifying if the touch is the same (that the first, it its for don't get the second and the other touchs that can confuse the joystick
//            if let joystickTouch = joystickTouch, touch == joystickTouch {
//                touchMoved(touch: touch)
//            }
//        }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            if let joystickTouch = joystickTouch, touch == joystickTouch {
//                //joystickTouch = zerar
//                movementOver()
//                joystickInUse = false
//            }
//        }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            if let joystickTouch = joystickTouch, touch == joystickTouch {
//                movementOver()
//                joystickInUse = false
//            }
//        }
//
//    }
//
//    override func update(_ currentTime: TimeInterval) {
//        camera?.position = player.position
//
//
//        // updating the position of the player according to the joystick
//        self.player.position.x += velocityX
//
//        //to change the face side of the player according to the joystick and movimentation
//        if velocityX < 0 {
//            player.xScale = -1
//        }
//        if velocityX > 0 {
//            player.xScale = 1
//        }
//    }
//}





class GameScene:SKScene{
    let velocityMultiplier: CGFloat = 0.12
    
    enum NodesZPosition: CGFloat {
      case background, player, joystick
    }

//    player
    var player = SKSpriteNode(texture: SKTexture(imageNamed: "player"))
    var currentPlayer = 1


    
    var cameraNode : SKCameraNode?
    
    var valorX:CGFloat = 0
    var valorY:CGFloat = 0
    
    
      lazy var analogJoystick: AnalogJoystick = {
        let js = AnalogJoystick(diameter: 200, colors: nil, images: (substrate: #imageLiteral(resourceName: "jSubstrate"), stick: #imageLiteral(resourceName: "jStick")))
          js.position.x = valorX
          js.position.y = valorY
          
//          js.position = CGPoint(x: self.frame.width * -0.33 + js.radius + 45, y: self.frame.height * -0.5 + js.radius + 45)
        js.zPosition = NodesZPosition.joystick.rawValue
        return js
      }()

    override func didMove(to view: SKView) {
        
        cameraNode = SKCameraNode()
        
        if let camera = cameraNode{
            camera.name = "cameraNode"
            self.addChild(camera) // adding camera to scene
        }
        self.camera = cameraNode // defining custom camera as level camera
        
        //background
        self.backgroundColor = SKColor.white

        //player
        self.player.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(player)

        //joystick
        setupJoystick()
      

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        if ((touchLocation.x) <= (self.frame.midX)){
            print("opa triscou ")
            
            
            print(valorX)
            print(valorY)
            
            
            
        }
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        cameraNode?.position = player.position
    }
    
    func setupJoystick() {
      
        cameraNode?.addChild(analogJoystick)
      
          analogJoystick.trackingHandler = { [unowned self] data in
            self.player.position = CGPoint(x: self.player.position.x + (data.velocity.x * self.velocityMultiplier),
                                         y: self.player.position.y + (data.velocity.y * self.velocityMultiplier))
            self.player.zRotation = data.angular
          }
      
    }

}

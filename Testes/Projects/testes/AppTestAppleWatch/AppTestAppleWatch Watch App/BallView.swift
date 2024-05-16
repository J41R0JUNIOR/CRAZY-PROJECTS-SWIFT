//
//  BallView.swift
//  AppTestAppleWatch Watch App
//
//  Created by Jairo Júnior on 06/05/24.
//

import SwiftUI
import CoreMotion


@Observable
class MotionManager{
    var timer : Timer?
    var motion = CMMotionManager()
    var x = 0.0
    var y = 0.0
    var z = 0.0
    
    init(){
        startDeviceMotion()
    }
    
    func startDeviceMotion() {
        
        //        if motion.isDeviceMotionAvailable {
        self.motion.deviceMotionUpdateInterval = 1.0 / 50.0
        self.motion.showsDeviceMovementDisplay = true
        self.motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
        
        // Configure a timer to fetch the motion data.
        self.timer = Timer(fire: Date(), interval: motion.deviceMotionUpdateInterval, repeats: true, block: { (timer) in
            if let data = self.motion.deviceMotion {
                // Get the attitude relative to the magnetic north reference frame.
                self.x = data.attitude.pitch
                self.y = data.attitude.roll
                self.z = data.attitude.yaw
                
                // Use the motion data in your app.
            }
        })
        
        // Add the timer to the current run loop.
        RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
        //        }
    }
}


struct BallView: View {
    @Bindable var motion = MotionManager()
    @State var timer: Timer?
    var body: some View {
        VStack{
            ZStack{
                Circle().offset(x: (motion.y * 1000) , y: (motion.x * 1000))
                Text("Ball").colorInvert().offset(x: (motion.y * 1000) , y: (motion.x * 1000))
            }
            
            
            Text("Giroscopio")
            Text("X: \(motion.x)")
            Text("Y: \(motion.y)")
            Text("Z: \(motion.z)")
        }
    }
}



#Preview {
    BallView()
}

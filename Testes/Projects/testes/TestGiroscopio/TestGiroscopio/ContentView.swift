//
//  ContentView.swift
//  TestGiroscopio
//
//  Created by Jairo Júnior on 03/05/24.
//

import SwiftUI
import CoreMotion


@Observable
class GyroscopeMotion{
    
    var timer : Timer?
    var motion = CMMotionManager()
    var x = 0.0
    var y = 0.0
    var z = 0.0
    
    var headingTo = 0.0
    
    var userGravity = 0.0
    
    
    init(){
        startDeviceMotion()
    }
    
    func startDeviceMotion() {
        
        self.motion.deviceMotionUpdateInterval = 1.0 / 50.0
        self.motion.showsDeviceMovementDisplay = true
        self.motion.startDeviceMotionUpdates(using: .xMagneticNorthZVertical)
        
        // Configure a timer to fetch the motion data.
        self.timer = Timer(fire: Date(), interval: motion.deviceMotionUpdateInterval, repeats: true, block: { (timer) in
            if let data = self.motion.deviceMotion {
                
                // Get the attitude relative to the magnetic north reference frame.
//                self.x = data.attitude.pitch
//                self.y = data.attitude.roll
//                self.z = data.attitude.yaw
                
                self.x = data.rotationRate.x
                self.y = data.rotationRate.y
                self.z = data.rotationRate.z
                print(self.x,self.y,self.z)
                
                //pegando a direcao
                self.headingTo = data.heading
                //                let a = data.rotationRate
                
                //pegando a aceleacao
                let userA = data.userAcceleration
                let media = (userA.x + userA.y + userA.z) / 3
                if(self.userGravity < abs(media)){
                    self.userGravity = abs(media)
                }
            }
        })
        
        RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
    }
    
    
}

@Observable
class AcelerometerPos{
    let motion = CMMotionManager()
    var x = 0.0
    var y = 0.0
    var z = 0.0
    var timer = Timer()
    var maxVelocidade = 0.0
    
    func startAccelerometers() {
        // Make sure the accelerometer hardware is available.
        self.motion.accelerometerUpdateInterval = 1.0 / 50.0  // 50 Hz
        self.motion.startAccelerometerUpdates()
        print("Time Stamp, Rotation Rate X, Rotation Rate Y, Rotation Rate Z")
        
        // Configure a timer to fetch the data.
        self.timer = Timer(fire: Date(), interval: motion.accelerometerUpdateInterval,
                           repeats: true, block: { (timer) in
            // Get the accelerometer data.
            if let data = self.motion.accelerometerData {
                self.x = data.acceleration.x
                self.y = data.acceleration.y
                self.z = data.acceleration.z
                
                let timeStamp = data.timestamp
                print("\(timeStamp), \(self.x), \(self.y), \(self.z)")
                
                //getting the gravity aceleration
                let a = data.acceleration
                let media = (a.x + a.y + a.z)/3
                //                print(media)
                if(abs(media) > self.maxVelocidade){
                    self.maxVelocidade = abs(media)
                }
            }
        })
        RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
    }
    
    func stopAcelerometers(){
        timer.invalidate()
    }
    
}


struct ContentView: View {
    @State var isTrue = false
    @Bindable var motion = GyroscopeMotion()
    @State var timer: Timer?
    @Bindable var acelerometer = AcelerometerPos()
    
    @State private var counter = 0
    
    var body: some View {
        VStack {
            ZStack{
                Triangle()
                    .trim(from: 0.0, to: 1)
                    .foregroundStyle(.blue)
                    .frame(width: 50, height: 100)
                    .rotationEffect(Angle(radians: -1 * (motion.headingTo * (.pi/180))))
                    .onTapGesture {
                        printValuesForOneSecond() // Inicia a impressão por um segundo ao clicar no triângulo
                    }
            }
            
            ///Giroscópio
            //            Text("Giroscope")
            //            Text("X: \(motion.x)")
            //            Text("Y: \(motion.y)")
            //            Text("Z: \(motion.z)")
            
            Text("Maior Média = \(acelerometer.maxVelocidade)")
            Button("Resetar"){
                acelerometer.maxVelocidade = 0.0
                adicionnaaa()
            }
            
            //            Text("User Acceleration \(motion.userGravity)")
            //            Button("Resetar"){
            //                motion.userGravity = 0.0
            //                adicionnaaa()
            //            }
            
            ///Acelerometro
            Text("Acelerometer")
            Text("X: \(acelerometer.x)")
            Text("Y: \(acelerometer.y)")
            Text("Z: \(acelerometer.z)")
        }
        .sensoryFeedback(.increase, trigger: counter)
        .padding()
    }
    
    func adicionnaaa(){
        counter += 1
    }
    
    func printValuesForOneSecond() {
        isTrue.toggle()
        
        if(isTrue){
            acelerometer.startAccelerometers()
        }else{
            acelerometer.stopAcelerometers()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            isTrue = false
            acelerometer.stopAcelerometers()
        }
    }
}



#Preview {
    ContentView()
}

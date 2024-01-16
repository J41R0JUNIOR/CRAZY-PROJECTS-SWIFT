import SwiftUI
import SceneKit

struct viewTest: UIViewRepresentable {
    let ball = SCNNode(geometry: SCNSphere())
    let scene: SCNScene = SCNScene()
    let sceneView = SCNView()

    func makeUIView(context: Context) -> SCNView {
        sceneView.scene = scene
        sceneView.backgroundColor = .blue
        
        let cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 0, z: 0)
        scene.rootNode.addChildNode(cameraNode)
        
        sceneView.allowsCameraControl = true
        sceneView.defaultCameraController.interactionMode = .orbitTurntable
        sceneView.defaultCameraController.inertiaEnabled = true
        
        ball.position = cameraNode.position
        scene.rootNode.addChildNode(ball)


       

        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {
    }

    typealias UIViewType = SCNView
}

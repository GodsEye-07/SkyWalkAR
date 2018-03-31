//
//  ViewController.swift
//  SkyWalkAR
//
//  Created by Ayush Verma on 31/03/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import Firebase

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet weak var button: customButton!
    @IBOutlet weak var xcor: UILabel!
    @IBOutlet weak var ycor: UILabel!
    @IBOutlet weak var zcor: UILabel!
    
 
    var buttonHighlighted = false
    var lineColor = UIColor.white
    var previousPoint: SCNVector3?
    
    var pulsarX = -0.3
    var pulsarY = -0.3
    var pulsarZ = -0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        // Create a new scene
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        let position1 = SCNVector3(0,0,-0.58)
        let position2 = SCNVector3(-1.27,-0,1.08)
        let position3 = SCNVector3(1.18,0,-1.5)
        let position4 = SCNVector3(-5.32,0,-2.28)
        let position5 = SCNVector3(8.12,0,-3.50)
        let position6 = SCNVector3(-30.22,0,-5.30)
        let position7 = SCNVector3(10.42,0,-7.77)
        let position8 = SCNVector3(-20.50,0,-11.09)
        let position9 = SCNVector3(x: -0.3, y: -0.3, z: -0.3)
        
        
        //give a position to the node
        let mercury = planet1(at: position1)
        let venus = planet2(at: position2)
        let earth = planet3(at: position3)
        let mars = planet4(at: position4)
        let jupiter = planet5(at: position5)
        let saturn = planet6(at: position6)
        let uranus = planet7(at: position7)
        let neptune = planet8(at: position8)
        let pulsar = Pulsar(at: position9)
        
        
        //adding the as the child in the node
        scene.rootNode.addChildNode(mercury)
        scene.rootNode.addChildNode(venus)
        scene.rootNode.addChildNode(earth)
        scene.rootNode.addChildNode(mars)
        scene.rootNode.addChildNode(jupiter)
        scene.rootNode.addChildNode(saturn)
        scene.rootNode.addChildNode(uranus)
        scene.rootNode.addChildNode(neptune)
        scene.rootNode.addChildNode(pulsar)
        
        
        //random stars.
        for _ in 1...250{
            
            let lowerValue = -15
            let upperValue = 5
            let Zlower = -5
            let Zupper = 2
            let result = Int(arc4random_uniform(UInt32(upperValue - lowerValue + 1))) +   lowerValue
            let Zresult = Int(arc4random_uniform(UInt32(Zupper - Zlower + 1))) +   Zlower
            let position10 = SCNVector3(Float(result),-(Float(CGFloat(arc4random()%20))),Float(Zresult))
            let star = Stars(at: position10)
            scene.rootNode.addChildNode(star)
        }
        
        //tracking the location and printing
        let currentCameraPosition:SCNVector3 = (sceneView.pointOfView?.position)!
        print(currentCameraPosition)
        
        
        
    }
    
    func Stars(at position:SCNVector3) -> SCNNode{
        
        
        let random = SCNSphere(radius: 0.03)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor(red: 224.0, green: 224.0, blue: 224.0, alpha: 1.0)
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 1 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
        
    }
    
    
    func planet1(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.11)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"mercury")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        
        let action = SCNAction.rotate(by: 60 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        
        return designNode
    }
    
    func planet2(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.18)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"venus")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        
        let action = SCNAction.rotate(by: 160 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    func planet3(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"earth")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 250 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    func planet4(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.106)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"mars")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 360 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    func planet5(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 1.1)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"jupiter")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 170 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    func planet6(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 1.5)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"saturn")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 40 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    func planet7(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.796)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"uranus")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 30 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    func planet8(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.773)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named:"neptune")
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 25 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    
    //the main STAR.
    func Pulsar(at position:SCNVector3) -> SCNNode{
        
        let random = SCNSphere(radius: 0.03)
        let material = SCNMaterial()
        material.diffuse.contents = UIColor(red: 224.0, green: 224.0, blue: 224.0, alpha: 1.0)
        random.firstMaterial = material
        let designNode = SCNNode(geometry:random)
        designNode.position = position
        let action = SCNAction.rotate(by: 1 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        let repeatAction = SCNAction.repeatForever(action)
        designNode.runAction(repeatAction)
        return designNode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        DispatchQueue.main.async {
            self.buttonHighlighted = self.button.isHighlighted
        }
    }
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval) {
        
        guard let pointOfView = sceneView.pointOfView else { return }
        
        let transform = pointOfView.transform
        let orientation = SCNVector3(-transform.m31, -transform.m32, transform.m33)
        let location = SCNVector3(transform.m41, transform.m42, transform.m43)
        let currentPositionOfCamera = orientation + location
        print(currentPositionOfCamera)
        
        for _ in 1...200{
            
                xcor.text = String((orientation.x + location.x) - Float(pulsarZ))
                ycor.text = String((orientation.y + location.y) - Float(pulsarY))
                zcor.text = String((orientation.z + location.z) - Float(pulsarX))
        }
        print(String((orientation.x + location.x) - Float(pulsarZ)))
        print(String((orientation.y + location.y) - Float(pulsarY)))
        print(String((orientation.z + location.z) - Float(pulsarX)))
        
        
                let x = ["Xcordinate" : xcor.text!, "Ycordinate" : ycor.text!, "Zcordinate": zcor.text!] as [String : Any]
        
                 Database.database().reference().childByAutoId().setValue(x)
        
        
        let mat = pointOfView.transform
        let dir = SCNVector3(-1 * mat.m31, -1 * mat.m32, -1 * mat.m33)
        let currentPosition = pointOfView.position + (dir * 0.1)
        if buttonHighlighted {
            if let previousPoint = previousPoint {
                let line = lineFrom(vector: previousPoint, toVector: currentPosition)
                let lineNode = SCNNode(geometry: line)
                lineNode.geometry?.firstMaterial?.diffuse.contents = lineColor
                sceneView.scene.rootNode.addChildNode(lineNode)
            }
        }
        previousPoint = currentPosition
        glLineWidth(50)
    }
    
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    
    func lineFrom(vector vector1: SCNVector3, toVector vector2: SCNVector3) -> SCNGeometry {
        
        let indices: [Int32] = [0, 1]
        
        let source = SCNGeometrySource(vertices: [vector1, vector2])
        let element = SCNGeometryElement(indices: indices, primitiveType: .line)
        
        return SCNGeometry(sources: [source], elements: [element])
    }
    
    
    //    static func +(lhv:SCNVector3, rhv:SCNVector3) -> SCNVector3 {
    //        return SCNVector3(lhv.x + rhv.x, lhv.y + rhv.y, lhv.z + rhv.z)
    //    }
    
    
    //end of the class brace.
}

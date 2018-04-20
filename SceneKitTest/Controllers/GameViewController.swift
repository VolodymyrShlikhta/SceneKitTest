//
//  GameViewController.swift
//  SceneKitTest
//
//  Created by Volodymyr Shlikhta on 20/4/18.
//  Copyright © 2018 Volodymyr Shlikhta. All rights reserved.
//

import UIKit
import SceneKit

fileprivate let pathToBackgroundImage = "SceneKitTest.scnassets/Textures/Background_Diffuse.png"

class GameViewController: UIViewController {
    private var spawnTime: TimeInterval = 0
    var scnView: SCNView!
    
    var scnScene: SCNScene!
    
    var cameraNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupScene()
        setupCamera()
        spawnShape()
    }
    
    private func setupView() {
        scnView = self.view as! SCNView
        scnView.delegate = self
        scnView.allowsCameraControl = false
        scnView.showsStatistics = true
        scnView.autoenablesDefaultLighting = true
        scnView.isPlaying = true
    }
    
    private func setupScene() {
        self.scnScene = SCNScene()
        scnView.scene = scnScene
        scnScene.background.contents = pathToBackgroundImage
    }
    
    private func setupCamera() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3(x: 0, y: 5, z: 10)
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    private func spawnShape() {
        // prepare geometry
        let geometry: SCNGeometry = Shape.random().getForm()
        let color = UIColor.random()
        geometry.materials.first?.diffuse.contents = color
        
        
        // setup node with geometry
        let geometryNode = SCNNode(geometry: geometry)
        
        // apply physics
        geometryNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: nil)
        
        // apply physics
        let randomX = Float.random(min: -2, max: 2)
        let randomY = Float.random(min: 10, max: 18)
        let force = SCNVector3(x: randomX, y: randomY , z: 0)
        let position = SCNVector3(x: 0.05, y: 0.05, z: 0.05)
        geometryNode.physicsBody?.applyForce(force,
                                             at: position, asImpulse: true)
        // add trail
        let trailEmitter = createTrail(color: color, geometry: geometry)
        geometryNode.addParticleSystem(trailEmitter)
        
        // add to scene
        scnScene.rootNode.addChildNode(geometryNode)
    }
    
    private func cleanScene() {
        for node in scnScene.rootNode.childNodes {
            if node.position.y < -2 {
                node.removeFromParentNode()
            }
        }
    }
    
    private func createTrail(color: UIColor, geometry: SCNGeometry) ->
        SCNParticleSystem {
            let trail = SCNParticleSystem(named: "Trail.scnp", inDirectory: nil)!
            trail.particleColor = color
            trail.emitterShape = geometry
            return trail
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

extension GameViewController: SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {
        if time > spawnTime {
            spawnShape()
            spawnTime = time + TimeInterval(Float.random(min: 0.2, max: 0.4))
        }
        cleanScene()
    }
}

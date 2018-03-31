//
//  PlanetNode.swift
//  SkyWalkAR
//
//  Created by Ayush Verma on 31/03/18.
//  Copyright © 2018 Ayush Verma. All rights reserved.
//

import SceneKit

class PlanetNode: SCNNode {
    override init() {
        super.init()
        
        
        let action = SCNAction.rotate(by: 360 * CGFloat((Double.pi)/180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        
        let repeatAction = SCNAction.repeatForever(action)
        
        self.runAction(repeatAction)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}


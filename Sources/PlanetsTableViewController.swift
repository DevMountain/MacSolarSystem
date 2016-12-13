//
//  PlanetsTableViewController.swift
//  Solar System
//
//  Created by Andrew Madsen on 12/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Cocoa

class PlanetsTableViewController: NSViewController {  
  dynamic var planets: [Planet] { return PlanetController.shared.planets }
}

//
//  PlanetController.swift
//  SolarSystem
//
//  Created by Caleb Hicks on 9/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class PlanetController {
  
  static let shared = PlanetController()
  
  private func loadPlanets() throws -> [Planet] {
    guard let planetFileURL = Bundle.main.url(forResource: "planets", withExtension: "json") else {
      throw NSError(domain: "com.devmountain.SolarSystem.ErrorDomain", code: -1, userInfo: nil)
    }
    let data = try Data(contentsOf: planetFileURL)
    guard let planetDicts = try JSONSerialization.jsonObject(with: data, options: []) as? [[String : Any]] else {
      throw NSError(domain: "com.devmountain.SolarSystem.ErrorDomain", code: -2, userInfo: nil)
    }
    return planetDicts.flatMap { Planet(dictionary: $0) }
  }
  
  lazy var planets: [Planet] = {
    do {
      return try self.loadPlanets()
    } catch {
      NSLog("Error loading planets from JSON: \(error)")
      return []
    }
  }()
}

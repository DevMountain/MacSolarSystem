//
//  Planet.swift
//  SolarSystem
//
//  Created by Caleb Hicks on 9/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import Cocoa

class Planet: NSObject {
  
  init(name: String, diameter: Int, dayLength: Float, millionKMsFromSun: Float) {
    
    self.name = name
    self.image = NSImage(named: name.lowercased())
    self.diameter = diameter
    self.dayLength = dayLength
    self.millionKMsFromSun = millionKMsFromSun
  }
  
  let name: String
  let image: NSImage?
  let diameter: Int
  let dayLength: Float
  let millionKMsFromSun: Float
}

extension Planet {
  
  static var NameKey: String { return "name" }
  static var DiameterKey: String { return "diameter" }
  static var DayLengthKey: String { return "dayLength" }
  static var DistanceKey: String { return "millionKMsFromSun" }
  
  convenience init?(dictionary: [String : Any]) {
    guard let name = dictionary[Planet.NameKey] as? String,
      let diameter = dictionary[Planet.DiameterKey] as? Int,
      let dayLength = dictionary[Planet.DayLengthKey] as? Float,
      let distance = dictionary[Planet.DistanceKey] as? Float else { return nil }
    
    self.init(name: name, diameter: diameter, dayLength: dayLength, millionKMsFromSun: distance)
  }
  
  var dictionaryRepresentation: [String : Any] {
    return [Planet.NameKey : name,
            Planet.DiameterKey : diameter,
            Planet.DayLengthKey : dayLength,
            Planet.DistanceKey : millionKMsFromSun]
  }
}

extension Planet {
  override var description: String {
    return "\(name) - Diameter: \(diameter) Day Length: \(dayLength) Distance: \(millionKMsFromSun) million km"
  }
}

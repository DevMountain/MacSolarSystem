//
//  PlanetsTableViewController.swift
//  Solar System
//
//  Created by Andrew Madsen on 12/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Cocoa

class PlanetsTableViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do view setup here.
  }
  
  // MARK: NSTableViewDataSource
  
  func numberOfRows(in tableView: NSTableView) -> Int {
    return PlanetController.shared.planets.count
  }
  
  func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
    let planets = PlanetController.shared.planets
    return planets[row]
  }
  
  // MARK: NSTableViewDelegate
  
  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    guard let column = tableColumn else { return nil }
    guard let view = tableView.make(withIdentifier: column.identifier, owner: self) as? NSTableCellView else { return nil }
    
    if let planet = self.tableView(tableView, objectValueFor: column, row: row) as? Planet {
      
      switch column.identifier {
      case "Image":
        view.imageView?.image = planet.image
      case "Planet":
        view.textField?.stringValue = planet.name
      case "Diameter":
        view.textField?.objectValue = planet.diameter
      case "DayLength":
        view.textField?.objectValue = planet.dayLength
      case "Distance":
        view.textField?.objectValue = planet.millionKMsFromSun
      default:
        break
      }
    }
    
    return view
  }
  
  @IBOutlet var tableView: NSTableView!
}

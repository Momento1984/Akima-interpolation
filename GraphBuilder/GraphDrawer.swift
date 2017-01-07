//
//  GraphDrawer.swift
//  GraphBuilder
//
//  Created by Виталий Антипов on 07.01.17.
//  Copyright © 2017 Виталий Антипов. All rights reserved.
//
import UIKit
class GraphDrawer {
  private struct Constants {
    static let HashmarkSize: CGFloat = 6
  }
  
  var color = UIColor.blue
  var minimumPointsPerHashmark: CGFloat = 40
  var contentScaleFactor: CGFloat = 1 // set this from UIView's contentScaleFactor to position axes with maximum accuracy
  
  convenience init(color: UIColor, contentScaleFactor: CGFloat) {
    self.init()
    self.color = color
    self.contentScaleFactor = contentScaleFactor
  }
  
  convenience init(color: UIColor) {
    self.init()
    self.color = color
  }
  
  convenience init(contentScaleFactor: CGFloat) {
    self.init()
    self.contentScaleFactor = contentScaleFactor
  }
  
  func drawLinesInRect(bounds: CGRect, origin: CGPoint, pointsPerUnit: CGFloat, points: [CGPoint]) {
    UIGraphicsGetCurrentContext()!.saveGState()
    color.set()
    let path = UIBezierPath()
    path.move(to: CGPoint(x: align(coordinate:points[0].x + origin.x), y: align(coordinate: origin.y - points[0].y)))
    for point in points{
      path.addLine(to: CGPoint(x: align(coordinate:point.x + origin.x), y: align(coordinate: origin.y - point.y)))
    }
    
    path.stroke()
    UIGraphicsGetCurrentContext()!.restoreGState()
  }
  
  private func align(coordinate: CGFloat) -> CGFloat {
    return round(coordinate * contentScaleFactor) / contentScaleFactor
  }
}


  

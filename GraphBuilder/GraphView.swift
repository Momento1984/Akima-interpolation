//
//  GraphView.swift
//  GraphBuilder
//
//  Created by Виталий Антипов on 06.01.17.
//  Copyright © 2017 Виталий Антипов. All rights reserved.
//

import UIKit

class GraphView: UIView {

  private let axesDrawer = AxesDrawer(color: UIColor.blue)
  private let graphDrawer = GraphDrawer(color: UIColor.red)
  
  
  var series = Array<(points: Array<CGPoint>, color: UIColor)>()
  
  
  // Only override draw() if you perform custom drawing.
  // An empty implementation adversely affects performance during animation.
  override func draw(_ rect: CGRect) {
    axesDrawer.drawAxesInRect(bounds: rect, origin: CGPoint(x: 30, y: rect.size.height - 20), pointsPerUnit: 1)
    for serie in series{
      graphDrawer.color = serie.color
      graphDrawer.drawLinesInRect(bounds: rect, origin: CGPoint(x: 30, y: rect.size.height - 20), pointsPerUnit: 1, points: serie.points)
    }
  }

}

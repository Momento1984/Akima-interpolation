//
//  ViewController.swift
//  GraphBuilder
//
//  Created by Виталий Антипов on 06.01.17.
//  Copyright © 2017 Виталий Антипов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var graphView: GraphView!

  struct Constant{
    static let dx: CGFloat = 1.0
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    let inputPoints = [CGPoint(x: 0, y: 0), CGPoint(x: 40, y: 40), CGPoint(x: 80, y: 50),
                       CGPoint(x: 120, y: 50), CGPoint(x: 140, y: 150), CGPoint(x: 150, y: 50), CGPoint(x: 200, y: 40), CGPoint(x: 240, y: 20)]
    
    graphView.series.append((inputPoints, UIColor.red))

    let akima = AkimaInterpolator(points: inputPoints)
    
    var splinePoints = [CGPoint]()
    var x = inputPoints.first!.x
    while x<=inputPoints.last!.x {
      
      splinePoints.append(CGPoint(x: x, y: akima.interpolate(value: x)))
      x += Constant.dx
    }
    
    graphView.series.append((splinePoints, UIColor.blue))
    graphView.setNeedsDisplay()
  }

}

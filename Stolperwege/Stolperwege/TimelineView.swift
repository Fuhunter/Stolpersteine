//
//  TimelineView.swift
//  Stolperwege
//
//  Created by Niclas Guenther on 05/04/16.
//  Copyright © 2016 Mkayswork. All rights reserved.
//

import UIKit

class TimelineView: UIView {

	
    override func drawRect(rect: CGRect) {
        // Drawing code
		
		let path = UIBezierPath()
		path.lineWidth = 2.0
		
		path.moveToPoint(CGPoint(x: self.bounds.width / 2, y: 140))
		path.addLineToPoint(CGPoint(x: self.bounds.width / 2, y: 210))
		
		path.moveToPoint(CGPoint(x: self.bounds.width / 2, y: 240))
		path.addLineToPoint(CGPoint(x: self.bounds.width / 2, y: 310))
		
		UIColor.blackColor().setStroke()
		
		path.stroke()
    }

}

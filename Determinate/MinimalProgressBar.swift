//
//  MinimalProgressBar.swift
//  ProgressKit
//
//  Created by Roland Schemers on 5/9/16.
//  Copyright © 2016 Kauntey Suryawanshi. All rights reserved.
//

import Foundation
import Cocoa

open class MinimalProgressBar: DeterminateAnimation {

    var progressLayer = CAShapeLayer()

    @IBInspectable open var borderColor: NSColor = NSColor.black {
        didSet {
            notifyViewRedesigned()
        }
    }

    override func notifyViewRedesigned() {
        super.notifyViewRedesigned()
        progressLayer.backgroundColor = foreground.cgColor
    }

    override func configureLayers() {
        super.configureLayers()
        progressLayer.frame = bounds
        progressLayer.backgroundColor = foreground.cgColor
        layer?.addSublayer(progressLayer)
    }

    override func updateProgress() {
        CATransaction.begin()
        if animated {
            CATransaction.setAnimationDuration(0.5)
        } else {
            CATransaction.setDisableActions(true)
        }
        let timing = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        CATransaction.setAnimationTimingFunction(timing)
        progressLayer.frame.size.width = bounds.width * progress
        CATransaction.commit()
    }
}

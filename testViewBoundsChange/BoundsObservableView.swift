//
//  BoundsObservableView.swift
//  PointMotionControl
//
//  Created by Papoj Thamjaroenporn on 6/15/18.
//

import UIKit

public protocol ViewBoundsObserving: class {
    func boundsWillChange(_ view: BoundsObservableView);
    func boundsDidChange(_ view: BoundsObservableView);
}

public class BoundsObservableView: UIView {
    
    public weak var boundsDelegate: ViewBoundsObserving?
    
    public override var bounds: CGRect {
        willSet {
            print("BOUNDS willSet bounds: \(bounds), frame: \(frame)")
            boundsDelegate?.boundsWillChange(self)
        }
        didSet {
            print("BOUNDS didSet bounds: \(bounds), frame: \(frame)")
            boundsDelegate?.boundsDidChange(self)
        }
    }

    public override var frame: CGRect {
        willSet {
            print("FRAME willSet frame: \(frame), bounds: \(bounds)")
            boundsDelegate?.boundsWillChange(self)
        }
        didSet {
            print("FRAME didSet frame: \(frame), bounds: \(bounds)")
            boundsDelegate?.boundsDidChange(self)
        }
    }
}

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
            print("bounds: \(bounds)")
            boundsDelegate?.boundsWillChange(self)
        }
        didSet {
            print("bounds didSet: \(bounds)")
            boundsDelegate?.boundsDidChange(self)
        }
    }

    public override var frame: CGRect {
        willSet {
            print("willSet frame: \(frame), bounds: \(bounds)")
            boundsDelegate?.boundsWillChange(self)
        }
        didSet {
            print("didSet frame: \(frame), bounds: \(bounds)")
            boundsDelegate?.boundsDidChange(self)
        }
    }


}

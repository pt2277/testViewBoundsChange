//
//  BoundsObservableView.swift
//  PointMotionControl
//
//  Created by Papoj Thamjaroenporn on 6/15/18.
//

import UIKit

public protocol ViewBoundsObserving: class {
    // Notifies the delegate that view's `bounds` has changed.
    func boundsDidChange(_ view: BoundsObservableView, from previousBounds: CGRect, to bounds: CGRect);
}

/// You can observe bounds change with this view subclass via `ViewBoundsObserving` delegate.
/// See also: [a forum post](https://forums.developer.apple.com/message/317152?et=watches.email.thread#317152) leading to this implementation.
public class BoundsObservableView: UIView {
    
    public weak var boundsDelegate: ViewBoundsObserving?
    
    private var previousBounds: CGRect = .zero
    
    public override func layoutSubviews() {
        if (bounds != previousBounds) {
            print("Bounds changed from \(previousBounds) to \(bounds)")
            boundsDelegate?.boundsDidChange(self, from: previousBounds, to: bounds)
            previousBounds = bounds
        }
        
        // UIView's implementation will layout subviews for me using Auto Resizing mask or Auto Layout constraints.
        super.layoutSubviews()
    }
}

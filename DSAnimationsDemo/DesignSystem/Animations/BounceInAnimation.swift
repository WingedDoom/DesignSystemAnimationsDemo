//
//  BounceInAnimation.swift
//  DSAnimationsDemo
//
//  Created by Булат Хабиров on 16.11.2021.
//

import UIKit

public struct BounceAnimationParameters {
    public var duration: TimeInterval
    public var scale: CGFloat
    
    public init(
        duration: TimeInterval = 0.12,
        scale: CGFloat = 0.1
    ) {
        self.duration = duration
        self.scale = scale
    }
}

public class BounceInAnimationBase: Animation {
    let parameters: BounceAnimationParameters
    public weak var target: UIView?
    
    private(set) lazy var animator = UIViewPropertyAnimator(
        duration: parameters.duration,
        timingParameters: timingParameters
    )
    
    var timingParameters: UITimingCurveProvider {
        UICubicTimingParameters(animationCurve: UIView.AnimationCurve.easeIn)
    }
    
    public init(
        parameters: BounceAnimationParameters,
        target: UIView? = nil
    ) {
        self.parameters = parameters
        self.target = target
    }
    
    func animations() { }
    
    public func start(completion: (() -> Void)?) {
        animator.addAnimations { [weak self] in
            self?.animations()
        }
        animator.addCompletion { _ in
            completion?()
        }
        animator.startAnimation()
    }
}

public final class BounceInScaleDownAnimation: BounceInAnimationBase {
    override var timingParameters: UITimingCurveProvider {
        UICubicTimingParameters(
            controlPoint1: .init(x: 0, y: -0.5),
            controlPoint2: .init(x: 1, y: 0.5)
        )
    }
    
    override func animations() {
        let scale = 1 - parameters.scale
        target?.transform = .init(scaleX: scale, y: scale)
    }
}

public final class BounceInScaleUpAnimation: BounceInAnimationBase {
    override var timingParameters: UITimingCurveProvider {
        UICubicTimingParameters(
            controlPoint1: .init(x: 0, y: 0),
            controlPoint2: .init(x: 0.5, y: 1.25)
        )
    }
    
    override func animations() {
        target?.transform = .identity
    }
}

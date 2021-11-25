//
//  ColorAnimation.swift
//  DSAnimationsDemo
//
//  Created by Булат Хабиров on 16.11.2021.
//

import UIKit

public struct ColorAnimationParameters {
    public var duration: TimeInterval
    public var newColor: UIColor
    
    public init(
        duration: TimeInterval = 0.12,
        newColor: UIColor
    ) {
        self.duration = duration
        self.newColor = newColor
    }
}

public final class ColorAnimation: Animation {
    public weak var target: UIView?
    private let parameters: ColorAnimationParameters
    
    private lazy var animator = UIViewPropertyAnimator(
        duration: parameters.duration,
        controlPoint1: .init(x: 0.39, y: 0.575),
        controlPoint2: .init(x: 0.565, y: 1)
    )
    
    public init(parameters: ColorAnimationParameters, target: UIView?) {
        self.parameters = parameters
        self.target = target
    }
    
    public func start(completion: (() -> Void)?) {
        animator.addAnimations { [weak self] in
            self?.target?.backgroundColor = self?.parameters.newColor
        }
        animator.addCompletion { _ in
            completion?()
        }
        
        animator.startAnimation()
    }
}

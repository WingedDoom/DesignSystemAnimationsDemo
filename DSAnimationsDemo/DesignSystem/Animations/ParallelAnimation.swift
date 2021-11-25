//
//  ParallelAnimation.swift
//  DSAnimationsDemo
//
//  Created by Булат Хабиров on 16.11.2021.
//

import UIKit

final class ParallelAnimation: Animation {
    private let animations: [Animation]
    
    public init(animations: [Animation]) {
        self.animations = animations
    }
    
    func start(completion: (() -> Void)?) {
        var didCallCompletion = false
        let commonCompletion = {
            guard !didCallCompletion else { return }
            didCallCompletion = true
            completion?()
        }
        
        animations.forEach {
            $0.start(completion: commonCompletion)
        }
    }
}

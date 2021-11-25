//
//  ControlHighlightInteraction.swift
//  DSAnimationsDemo
//
//  Created by Булат Хабиров on 16.11.2021.
//

import UIKit

struct ControlHighlightInteractionParameters {
    var highlightedColor: UIColor
    var releasedColor: UIColor
}

public final class ControlHighlightInteraction {
    let parameters: ControlHighlightInteractionParameters
    weak var targetControl: UIControl? {
        didSet {
            setupObservation()
            setupAnimations()
        }
    }
    
    private var highlightedObservation: NSKeyValueObservation?
    private var highlightAnimation: Animation?
    private var releaseAnimation: Animation?
    private var isAnimatingHighlight = false
    
    init(parameters: ControlHighlightInteractionParameters) {
        self.parameters = parameters
    }
    
    deinit {
        highlightedObservation?.invalidate()
        highlightedObservation = nil
    }
    
    private func setupObservation() {
        highlightedObservation = targetControl?.observe(\.isHighlighted, options: [.new, .old]) { [weak self] control, change in
            guard change.oldValue != change.newValue else { return }
            self?.controlDidChangeHighlightedState(control.isHighlighted)
        }
    }
    
    private func setupAnimations() {
        highlightAnimation = ParallelAnimation(animations: [
            ColorAnimation(parameters: .init(newColor: parameters.highlightedColor), target: targetControl),
            BounceInScaleDownAnimation(parameters: .init(), target: targetControl)
        ])
        releaseAnimation = ParallelAnimation(animations: [
            ColorAnimation(parameters: .init(newColor: parameters.releasedColor), target: targetControl),
            BounceInScaleUpAnimation(parameters: .init(), target: targetControl)
        ])
    }
    
    private func controlDidChangeHighlightedState(_ newValue: Bool) {
        guard !isAnimatingHighlight else { return }
        
        if newValue {
            // начали хайлайтить
            isAnimatingHighlight = true
            highlightAnimation?.start { [weak self] in
                guard let self = self else { return }
                self.isAnimatingHighlight = false
                if self.targetControl?.isHighlighted == false {
                    // если к окончанию анимаций перестали хайлайтить - анимируем релиз
                    self.releaseAnimation?.start()
                }
            }
        } else {
            // перестали хайлайтить
            guard !isAnimatingHighlight else { return }
            releaseAnimation?.start()
        }
    }
}

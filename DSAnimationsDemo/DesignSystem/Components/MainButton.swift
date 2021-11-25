//
//  MainButton.swift
//  DSAnimationsDemo
//
//  Created by Булат Хабиров on 16.11.2021.
//

import UIKit

final class MainButton: UIControl {
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.textPrimaryInverted
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let highlightInteraction = ControlHighlightInteraction(
        parameters: .init(highlightedColor: .backgroundPrimaryInverted, releasedColor: .backgroundSecondaryInverted)
    )
    
    var text: String {
        get {
            label.text ?? ""
        }
        
        set {
            label.text = newValue
            invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        .init(width: label.intrinsicContentSize.width + 32, height: 50)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        didLoad()
    }
}

private extension MainButton {
    func didLoad() {
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 16)
        ])
        
        backgroundColor = UIColor.backgroundSecondaryInverted
        layer.cornerRadius = 16
        
        highlightInteraction.targetControl = self
    }
}

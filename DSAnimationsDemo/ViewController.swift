//
//  ViewController.swift
//  DSAnimationsDemo
//
//  Created by Булат Хабиров on 16.11.2021.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = MainButton()
        button.text = "Нажми меня!"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    var numberOfTaps = 0
    var animation: Animation?
    // метод чтобы играться
    @objc func didTapButton(_ sender: UIButton) {
    }
}


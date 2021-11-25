//
//  Animation.swift
//  DSAnimationsDemo
//
//  Created by Булат Хабиров on 16.11.2021.
//

protocol Animation {
    func start(completion: (() -> Void)?)
}

extension Animation {
    func start() {
        start(completion: nil)
    }
}

//
//  CustomButton.swift
//  MPVTest
//
//  Created by Kirill Taraturin on 28.11.2023.
//

import UIKit

final class CustomButton: UIButton {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        bounds.insetBy(dx: -40, dy: -40).contains(point)
    }
}

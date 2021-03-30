//
//  DesignableSlider.swift
//  The Quiz
//
//  Created by Nick on 31.03.2021.
//

import UIKit

@IBDesignable
class DesignableSlider: UISlider {

    @IBInspectable var thumbImage: UIImage? {
        didSet {
            setThumbImage(thumbImage, for: .normal)
        }
    }
    @IBInspectable var thumbHighLightedImage: UIImage? {
        didSet {
            setThumbImage(thumbHighLightedImage, for: .highlighted)
        }
    }
}

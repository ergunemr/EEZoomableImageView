//
//  ParrotPhotoCollectionViewCell.swift
//  ZoomableImageView
//
//  Created by Emre on 3.10.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

class ParrotPhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var zoomableImageView: EEZoomableImageView! {
        didSet {
            zoomableImageView.minZoomScale = 0.5
            zoomableImageView.maxZoomScale = 3.0
            zoomableImageView.resetAnimationDuration = 0.5
        }
    }
}

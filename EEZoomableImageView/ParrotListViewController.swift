//
//  ParrotListViewController.swift
//  EEZoomableImageView
//
//  Created by Emre on 3.10.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

class ParrotListViewController: UIViewController {
    
    let kCollectionViewInset: CGFloat = 20
    let kShowBigSegueIdentifier = "showBigImageSegue"
    
    let parrotImages: [UIImage?] = {
        var images = [UIImage?]()
        for number in 0...7 {
            images.append(UIImage(named: "parrot\(number)"))
        }
        return images
    }()
    
    @IBOutlet weak var parrotsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareCollectionView()
    }
    
    private func prepareCollectionView() {
        parrotsCollectionView.register(UINib(nibName: "ParrotPhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "parrotCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: kCollectionViewInset, left: kCollectionViewInset, bottom: kCollectionViewInset, right: kCollectionViewInset)
        parrotsCollectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == kShowBigSegueIdentifier, let bigImageVC = segue.destination as? BigImageViewController, let parrotImage = sender as? UIImage else { return }
        bigImageVC.parrotImage = parrotImage
    }
}

extension ParrotListViewController: ZoomingDelegate {
    func pinchZoomHandlerStartPinching() {
        print("pinchZoomHandlerStartPinching")
    }
    
    func pinchZoomHandlerEndPinching() {
        print("pinchZoomHandlerEndPinching")
    }
}

extension ParrotListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return parrotImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let parrotCell = collectionView.dequeueReusableCell(withReuseIdentifier: "parrotCell", for: indexPath) as? ParrotPhotoCollectionViewCell else { fatalError() }
        parrotCell.zoomableImageView.image = parrotImages[indexPath.row]
        return parrotCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let referenceSize = (UIScreen.main.bounds.size.width - 3*kCollectionViewInset)/2
        return CGSize(width: referenceSize, height: referenceSize*1.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return kCollectionViewInset
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: kShowBigSegueIdentifier, sender: parrotImages[indexPath.row])
    }
}

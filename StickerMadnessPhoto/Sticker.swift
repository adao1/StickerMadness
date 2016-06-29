//
//  Sticker.swift
//  StickerMadnessPhoto
//
//  Created by Alex Dao on 6/29/16.
//  Copyright © 2016 Alex Dao. All rights reserved.
//

import UIKit

class Sticker: UIImageView, UIGestureRecognizerDelegate {
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.image = image
        self.userInteractionEnabled = true
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector (self.handlePan(_:)))
        // :_ passes in the self, as in the gesture pertaining to the initializer
        self.addGestureRecognizer(pan)
        pan.delegate = self
        
        let pinch = UIPinchGestureRecognizer(target:self, action: #selector (self.handlePinch(_:)))
        self.addGestureRecognizer(pinch)
        pinch.delegate = self
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector (self.handleRotate(_:)))
        self.addGestureRecognizer(rotate)
        rotate.delegate = self
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector (self.handleLongPress(_:)))
        self.addGestureRecognizer(longPress)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(image: nil)
    }
    
    func handlePan(panGestureRecognizer: UIPanGestureRecognizer!) {
//        if panGestureRecognizer.state == .Began || panGestureRecognizer.state == .Changed {
            let translation = panGestureRecognizer.translationInView(panGestureRecognizer.view) //get the spot it is at now
            if let view = panGestureRecognizer.view {
                let affinerTransformationTranslate = CGAffineTransformTranslate(view.transform, translation.x, translation.y)
                view.transform = affinerTransformationTranslate
                panGestureRecognizer.setTranslation(CGPointZero, inView: view)
            }
//            else {
//                print("No view")
//            }
//        }
    }
    
    func handlePinch(recognizer : UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = CGAffineTransformScale(view.transform,
                                                    recognizer.scale, recognizer.scale)
            recognizer.scale = 1
        }
    }
    
    func handleRotate(recognizer : UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = CGAffineTransformRotate(view.transform, recognizer.rotation)
            recognizer.rotation = 0
        }
    }
    
    func handleLongPress(recognizer: UILongPressGestureRecognizer) {
        self.removeFromSuperview()
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    

}

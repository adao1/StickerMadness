//
//  ViewController.swift
//  StickerMadnessPhoto
//
//  Created by Alex Dao on 6/28/16.
//  Copyright © 2016 Alex Dao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var photoTakingHelper: PhotoTakingHelper?

    @IBOutlet weak var displayedImage: UIImageView!
//    @IBOutlet weak var hatSticker: UIImageView!
//    @IBOutlet weak var mustacheSticker: UIImageView!
//    @IBOutlet weak var glassesSticker: UIImageView!
//    @IBOutlet weak var hatButton: UIButton!
//    @IBOutlet weak var buttonStack: UIStackView!
    
    var hat = false
    var mustache = false
    var glasses = false
    
    var mustacheSticker: Sticker? = nil
    var hatSticker: Sticker? = nil
    var eyeglasses: Sticker? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        hatButton.hidden = true
//        buttonStack.hidden = true
        
        self.tabBarController?.delegate = self
    }
    
    
    func takePhoto() {
        // instantiate photo taking class, provide callback for when photo is selected
        photoTakingHelper = PhotoTakingHelper(viewController: self.tabBarController!) { (image: UIImage?) in
            print("received a callback")
//            self.hatButton.hidden = false
//            self.buttonStack.hidden = false
            self.displayedImage.image = image
        }
    }
    
    @IBAction func hatAction(sender: AnyObject) {
        if !hat {
//            hatSticker.image = UIImage(named: "hat1")
            hatSticker = Sticker(image: UIImage(named: "hat1"))
            self.view.addSubview(hatSticker!)
            hat = true
        } else {
            hat = false
//            hatSticker.image = nil
//            self.view.willRemoveSubview(hatSticker!)
            hatSticker?.removeFromSuperview()
        }
    }
    
    @IBAction func mustacheAction(sender: AnyObject) {
        if !mustache {
//            mustacheSticker.image = UIImage(named: "mustache1")
            mustacheSticker = Sticker(image: UIImage(named: "mustache3"))
            self.view.addSubview(mustacheSticker!)
            mustache = true
        } else {
            mustache = false
//            self.view.willRemoveSubview(mustacheSticker!)
//            mustacheSticker.image = nil
            mustacheSticker?.removeFromSuperview()
        }

    }
    @IBAction func glassesAction(sender: AnyObject) {
        if !glasses {
//            glassesSticker.image = UIImage(named: "eyeglasses1")
            eyeglasses = Sticker(image: UIImage(named: "eyeglasses1"))
            self.view.addSubview(eyeglasses!)
            glasses = true
        } else {
            glasses = false
           eyeglasses?.removeFromSuperview()
//            glassesSticker.image = nil
        }

    }
    
    
}

// MARK: Tab Bar Delegate

extension ViewController: UITabBarControllerDelegate {
    
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if (viewController is ViewController) {
            takePhoto()
            return false
        } else {
            return true
        }
    }
}

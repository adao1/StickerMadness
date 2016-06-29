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
    @IBOutlet weak var hatSticker: UIImageView!
    @IBOutlet weak var mustacheSticker: UIImageView!
    @IBOutlet weak var glassesSticker: UIImageView!
    var hat = false
    var mustache = false
    var glasses = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.delegate = self
    }
    
    func takePhoto() {
        // instantiate photo taking class, provide callback for when photo is selected
        photoTakingHelper = PhotoTakingHelper(viewController: self.tabBarController!) { (image: UIImage?) in
            print("received a callback")
            self.displayedImage.image = image
        }
    }
    
    @IBAction func hatAction(sender: AnyObject) {
        if !hat {
            hatSticker.image = UIImage(named: "hat1")
            hat = true
        } else {
            hat = false
            hatSticker.image = nil
        }
    }
    
    @IBAction func mustacheAction(sender: AnyObject) {
        if !mustache {
            mustacheSticker.image = UIImage(named: "mustache1")
            mustache = true
        } else {
            mustache = false
            mustacheSticker.image = nil
        }

    }
    @IBAction func glassesAction(sender: AnyObject) {
        if !glasses {
            glassesSticker.image = UIImage(named: "eyeglasses1")
            glasses = true
        } else {
            glasses = false
            glassesSticker.image = nil
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

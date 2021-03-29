//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Yuriy Hammeke on 25.03.21.
//

import UIKit

    class MemesDetailViewController: UIViewController {
    // MARK: Properties
        
    var meme: Meme! = nil
    @IBOutlet weak var memeImageView: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Tab Bar.
        self.tabBarController?.tabBar.isHidden = true
        // set the Meme Image.
        memeImageView.image = meme.memedImage
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Show the Tab Bar.
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override var prefersStatusBarHidden : Bool {
        return true     // set the status of the status bar to hidden
    }
}

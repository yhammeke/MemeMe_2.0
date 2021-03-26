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
        // set the Meme Image
        memeImageView.image = meme.memedImage
    }
    
    override var prefersStatusBarHidden : Bool {
        return true     // set the status of the status bar to hidden
    }

}

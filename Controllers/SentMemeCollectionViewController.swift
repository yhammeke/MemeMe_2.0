//
//  SentMemeCollectionViewController.swift
//  MemeMe
//
//  Created by Yuriy Hammeke on 24.03.21.
//

import UIKit

class SentMemeCollectionViewController: UICollectionViewController {
    
    @IBOutlet var flowLayout: UICollectionViewFlowLayout!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView?.reloadData()
    }
    
    // MARK: Collection Functions
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(appDelegate.memes.count)
        return appDelegate.memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! SentMemeCollectionViewCell
        
        let meme: Meme = appDelegate.memes[indexPath.row]
        cell.memeImageView!.image = meme.memedImage
        return cell
    }
    
    // Detailed view transition
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MemesDetailViewController") as! MemesDetailViewController
        controller.meme = appDelegate.memes[indexPath.row]
        navigationController!.pushViewController(controller, animated: true)
    }
 
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    
}

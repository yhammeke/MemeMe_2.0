//
//  SentMemeTableViewController.swift
//  MemeMe
//
//  Created by Yuriy Hammeke on 25.03.21.
//

import UIKit

class SentMemeTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        self.tableView.rowHeight = 100.0
        //tableView.estimatedRowHeight = tableView.rowHeight
        //tableView.rowHeight = UITableView.automaticDimension
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: Table View Functions
    
    // Number of elements for the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.memes.count
    }
    
    // Prepare the table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SentMemeTableViewCell", for: indexPath) as! SentMemeTableViewCell
        let meme: Meme = appDelegate.memes[indexPath.row]
        cell.cellTopText?.text = meme.topText
        cell.cellBottomText?.text = meme.bottomText
        cell.cellImageView?.image = meme.memedImage
        return cell
    }
    
    // Go to detail view
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "MemesDetailViewController") as! MemesDetailViewController
        controller.meme = appDelegate.memes[indexPath.row]
        navigationController!.pushViewController(controller, animated: true)
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
}

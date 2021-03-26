//
//  SentMemeTableViewController.swift
//  MemeMe
//
//  Created by Yuriy Hammeke on 25.03.21.
//

import UIKit

class SentMemeTableViewController: UITableViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        self.tableView.rowHeight = 100.0
        
        // Use the edit button provided by the view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            appDelegate.memes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            //super.setEditing(isEditing, animated: true)
            if appDelegate.memes.count == 0 {
                //
            }
            
        }
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

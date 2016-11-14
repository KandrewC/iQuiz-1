//
//  ViewController.swift
//  iQuiz
//
//  Created by Andrew Kan on 11/6/16.
//  Copyright © 2016 Andrew Kan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var settings: UIButton!
    
    @IBOutlet var tableView: UITableView!
    let textCellIdentifier = "quizCell"
    let quizzes = [("Mathematics", "Are you good at math?"), ("Marvel Super Heros", "Save the world one hero at a time."), ("Science", "Some fun science questions!")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as UITableViewCell
        
        let (quizName, description) = quizzes[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = quizName
        cell.detailTextLabel?.text = description
        var image = UIImage(named: "")
        switch quizName {
        case "Mathematics":
            image = UIImage(named: "math");
        case "Marvel Super Heros":
            image = UIImage(named: "marvel");
        default:
            image = UIImage(named: "science");
        }
        cell.imageView?.image = image
        cell.imageView?.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return cell
    }
    
    func tableView(_ tableView : UITableView,  titleForHeaderInSection section: Int)->String? {
        return "Quizzes"
    }
    
    
    @IBAction func settings(_ sender: AnyObject) {
   
        let alertController = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    
        
    
}


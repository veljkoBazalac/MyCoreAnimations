//
//  HomeVC.swift
//  MyCoreAnimations
//
//  Created by VELJKO on 3.11.22..
//

import UIKit

class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let animations : [String] = ["Move", "Scale", "Rotate", "Shake", "Circling", "Slide"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100
        tableView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.animations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = self.animations[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.separatorInset.right = 15
        cell.separatorInset.left = 15
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "moveSegue", sender: self)
        case 1:
            performSegue(withIdentifier: "scaleSegue", sender: self)
        case 2:
            performSegue(withIdentifier: "rotateSegue", sender: self)
        case 3:
            performSegue(withIdentifier: "shakeSegue", sender: self)
        case 4:
            performSegue(withIdentifier: "circlingSegue", sender: self)
        case 5:
            performSegue(withIdentifier: "slideSegue", sender: self)
        default:
            performSegue(withIdentifier: "moveSegue", sender: self)
        }
    }
    
    
    

}

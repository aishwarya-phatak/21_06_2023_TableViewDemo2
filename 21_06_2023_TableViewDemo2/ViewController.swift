//
//  ViewController.swift
//  21_06_2023_TableViewDemo2
//
//  Created by Vishal Jagtap on 18/07/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var studenttableView : UITableView?
    
    var studentFirstNames : [String] = ["Tanaji","Vaibhav","Prathamesh","Sahil"]
    var studentLastNames : [String] = ["ABC","ABC","ABC","ABC"]
    var studentCities : [String] = ["Pune","Pune","Pune","Pune"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        studentFirstNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }


}


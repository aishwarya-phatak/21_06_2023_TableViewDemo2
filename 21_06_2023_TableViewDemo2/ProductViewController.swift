//
//  ProductViewController.swift
//  21_06_2023_TableViewDemo2
//
//  Created by Vishal Jagtap on 19/07/23.
//

import UIKit

class ProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var productNames : [String] = ["Mixer","Refigerator","Oven"]
    var productPrice : [String] = ["3000.00","20000.00","15000.00"]
    var productRating : [String] = ["3","4","5"]
    
    @IBOutlet weak var productTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerAnXIBWithTableView()
        productTableView.dataSource = self
        productTableView.delegate = self
    }

    func registerAnXIBWithTableView(){
       let uiNib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.productTableView.register(uiNib, forCellReuseIdentifier: "ProductTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productTableViewCell = self.productTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        
        productTableViewCell.productName.text = productNames[indexPath.row]
        productTableViewCell.productPrice.text = productPrice[indexPath.row]
        productTableViewCell.productRating.text = productRating[indexPath.row]
        productTableViewCell.productImage.image = UIImage(named: "dummyProduct")
        
        return productTableViewCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180.0
    }
}

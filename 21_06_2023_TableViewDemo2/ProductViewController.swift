//
//  ProductViewController.swift
//  21_06_2023_TableViewDemo2
//
//  Created by Vishal Jagtap on 19/07/23.
//

import UIKit

class ProductViewController: UIViewController{
    
    var productNames : [String] = ["Mixer","Refigerator","Oven"]
    var productPrice : [String] = ["3000.00","20000.00","15000.00"]
    var productRating : [String] = ["3","4","5"]
    var productImages = [UIImage(named: "nature_image2"),UIImage(named: "nature_image3"), UIImage(named: "nature_image4")]
    
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
}

//MARK : ProductViewController conforms to UITableViewDataSource
extension ProductViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productNames.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productTableViewCell = self.productTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
        
        let switchOne = UISwitch()
        switchOne.isOn = true
        productTableViewCell.accessoryView = switchOne
        switchOne.addTarget(self,
                            action:#selector(isSwitchOn(_ :)),
                            for: .valueChanged)
        
        productTableViewCell.productName.text = productNames[indexPath.row]
        productTableViewCell.productPrice.text = productPrice[indexPath.row]
        productTableViewCell.productRating.text = productRating[indexPath.row]
        //productTableViewCell.productImage.image = UIImage(named: "dummyProduct")
        productTableViewCell.productImage.image = productImages[indexPath.item]
        
        return productTableViewCell
    }
    
    
   @objc func isSwitchOn(_ sender : UISwitch){
       if sender.isOn == true {
            print("Switch is kept On")
        } else {
            print("The switch id disabled")
        }
    }
}

//MARK : ProductViewController conforms to UITableViewDelegate
extension ProductViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

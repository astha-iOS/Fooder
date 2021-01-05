//
//  CartVC.swift
//  Fooder
//
//  Created by Astha yadav on 03/01/21.
//

import UIKit

class CartVC: UIViewController {
    @IBOutlet weak var tblCart: UITableView!
    
    var arrCart = NSMutableArray()
    var total = 0
    @IBOutlet weak var lbl_totalPrice: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - view Will Appear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
       
        
        for dic in arrCart {
            let dict = dic as! [String:String]
            let price = dict["price"] ?? ""
            total = total + Int(price)!
        }
        
        lbl_totalPrice.text = String(total) + " " + "USD"
        
    }
    
    //MARK: Back Click Action
    @IBAction func back_Click(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

//MARK:- UITableView Delegate DataSource
extension CartVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTblCell", for: indexPath) as! CartTblCell

        let dict = arrCart[indexPath.row] as! [String:String]
        cell.lbl_name.text = dict["type"] ?? ""
        let strPrice = dict["price"] ?? ""
        cell.lbl_price.text = strPrice + " " + "USD"
        cell.img.image = UIImage(named: dict["img"] ?? "")
        
        cell.removePressed = {
            
            self.arrCart.removeObject(at:indexPath.row)
            self.total = self.total - Int(dict["price"] ?? "0")!
            self.lbl_totalPrice.text = String(self.total) + " " + "USD"
            self.tblCart.reloadData()
        }

        return cell
    }
    
        
}

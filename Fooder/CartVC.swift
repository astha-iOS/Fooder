//
//  CartVC.swift
//  Fooder
//
//  Created by Astha yadav on 03/01/21.
//

import UIKit

class CartVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Back Click Action
    @IBAction func back_Click(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

//MARK:- UITableView Delegate DataSource
extension CartVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartTblCell", for: indexPath) as! CartTblCell

        
        cell.removePressed = {
            
            
        }

        return cell
    }
    
        
}

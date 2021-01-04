//
//  CartTblCell.swift
//  Fooder
//
//  Created by Astha yadav on 03/01/21.


import UIKit

class CartTblCell: UITableViewCell {
    
    
    @IBOutlet weak var btn_remove: UIButton!
    
    var removePressed : (() -> ()) = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func removeAction(_ sender: UIButton) {
       //Call your closure here
        removePressed()
    }
    
    
}

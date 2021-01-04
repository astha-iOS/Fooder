//
//  HomeTblCell.swift
//  Fooder
//
//  Created by Astha yadav on 03/01/21.
//

import UIKit

class HomeTblCell: UITableViewCell {
    @IBOutlet weak var btn_price: UIButton!
    
    @IBOutlet weak var back_View: UIView!
    
    @IBOutlet weak var img_item: UIImageView!
    @IBOutlet weak var lbl_name: UILabel!
    
    @IBOutlet weak var lbl_description: UILabel!
    
    @IBOutlet weak var lbl_size: UILabel!
    
    var priceClick : (() -> ()) = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func price_Action(_ sender: Any) {
        priceClick()
    }
}

//
//  HomeVC.swift
//  Fooder
//
//  Created by Astha yadav on 03/01/21.
//

import UIKit

class HomeVC: UIViewController,ViewPagerDataSource {
    @IBOutlet weak var lbl_cartItemNo: UILabel!
    
    @IBOutlet weak var header_view: UIView!
    @IBOutlet weak var tbl_View: UITableView!
    
    @IBOutlet weak var view_pager: ViewPager!
    @IBOutlet weak var btn_cart: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn1: UIButton!
    
    var arrSliderImages = ["b1", "b4", "b3"]
    var arrCat = ["a1","a2","a3","a4"]
    var arrCartItems = NSMutableArray()
    
    var arrItems = [["img":"a1",
                     "type":"Plain Pizza",
                     "description":"lorem ipsum doller sit amet.....",
                     "weight":"200 grams",
                     "size":"25 cm","price":"30"],
                    ["img":"a2",
                    "type":"Veg Pizza",
                    "description":"lorem ipsum doller sit amet.....",
                    "weight":"300 grams",
                    "size":"35 cm","price":"35"],
                    ["img":"a3",
                    "type":"Paneer Pizza",
                    "description":"lorem ipsum doller sit amet.....",
                    "weight":"250 grams",
                    "size":"20 cm","price":"45"],
                    ["img":"a4",
                    "type":"Onion Pizza",
                    "description":"lorem ipsum doller sit amet.....",
                    "weight":"500 grams",
                    "size":"50 cm","price":"60"],
    
    
    ]

    var arrChooseIdx = NSMutableArray()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view_pager.dataSource = self
        view_pager.animationNext()
        
        btn1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        btn1.layer.borderWidth = 1.0
        btn1.layer.cornerRadius = btn1.layer.frame.size.height/2
        btn1.clipsToBounds = true
        
        btn2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        btn2.layer.borderWidth = 1.0
        btn2.layer.cornerRadius = btn2.layer.frame.size.height/2
        btn2.clipsToBounds = true
        
        btn_cart.layer.cornerRadius = btn_cart.layer.frame.size.height/2
        btn_cart.clipsToBounds = true
        
        lbl_cartItemNo.layer.cornerRadius = lbl_cartItemNo.layer.frame.size.height/2
        lbl_cartItemNo.clipsToBounds = true
       
    }
    
    
    //MARK:- View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view_pager.scrollToPage(index: 0)
        
        header_view.roundCorners(corners: [.topLeft, .topRight], radius: 40.0)
        
        self.lbl_cartItemNo.text = "0"
        if arrCartItems.count>0{
            arrCartItems.removeAllObjects()
            arrChooseIdx.removeAllObjects()
        }
    }
    
    //MARK: - Cart Click Action
    @IBAction func cart_Click(_ sender: Any) {
        // Safe Push VC
        if arrCartItems.count>0 {
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CartVC") as? CartVC {
                if let navigator = navigationController {
                    vc.arrCart = arrCartItems
                    navigator.pushViewController(vc, animated: true)
                    
                }
                
            }
        }
        
    }
    
    

    //MARK:- View Pager DataSource
    func numberOfItems(viewPager:ViewPager) -> Int {
        return arrSliderImages.count
    }
    
    func viewAtIndex(viewPager:ViewPager, index:Int, view:UIView?) -> UIView {
        var newView = view;
        var img:UIImageView?
        if(newView == nil){
            newView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:  self.view.frame.height))
            
            img = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:  400))
            
            img?.image = UIImage(named: arrSliderImages[index])
            newView?.addSubview(img!)
            
        }
               
        return newView!
    }
    
    func didSelectedItem(index: Int) {
        print("select index \(index)")
    }
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTblCell", for: indexPath) as! HomeTblCell

        cell.back_View.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.back_View.layer.borderWidth = 1.0
        cell.back_View.layer.cornerRadius = 20.0
        cell.back_View.clipsToBounds = true
       
        cell.btn_price.layer.cornerRadius = cell.btn_price.frame.size.height/2
        cell.btn_price.clipsToBounds = true
        
        let dict = arrItems[indexPath.row]
        cell.lbl_name.text = dict["type"]
        cell.lbl_description.text = dict["description"]
        let strWeight = dict["weight"] ?? ""
        let strSize = dict["size"] ?? ""
        cell.lbl_size.text = strWeight + " " + strSize
        let strPrice = dict["price"] ?? ""
        cell.btn_price.setTitle((strPrice + " " + "USD"), for: .normal)
        
        cell.img_item?.image = UIImage(named: dict["img"]! )
        
        cell.priceClick = {
            
            cell.btn_price.setTitle("Add", for: .highlighted)
            
            if self.arrChooseIdx.contains(indexPath.row){
                self.arrChooseIdx.remove(indexPath.row)
                self.arrCartItems.remove(self.arrItems[indexPath.row])
            }else{
                self.arrChooseIdx.add(indexPath.row)
                self.arrCartItems.add(self.arrItems[indexPath.row])
            }
            
            self.lbl_cartItemNo.text = String(self.arrChooseIdx.count)
        }
        
        return cell
    }
    
        
}

extension UIButton{
    
    
}
extension UIView{
    
    
}
extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}

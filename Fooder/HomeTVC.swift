//
//  HomeTVC.swift
//  Fooder
//
//  Created by Astha yadav on 01/01/21.
//

import UIKit

class HomeTVC: UITableViewController, ViewPagerDataSource {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var viewPager: ViewPager!
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var itemColView: UICollectionView!
    
    
    var arrFoods = ["Paneer Pizza", "Plain Pizza", "Onion Pizza"]
    var arrSliderImages = ["s1", "s2", "s3", "s4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewPager.dataSource = self
        viewPager.animationNext()
        
        btn1.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        btn1.layer.borderWidth = 1.0
        btn1.layer.cornerRadius = btn1.layer.frame.size.height/2
        btn1.clipsToBounds = true
        
        btn2.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        btn2.layer.borderWidth = 1.0
        btn2.layer.cornerRadius = btn2.layer.frame.size.height/2
        btn2.clipsToBounds = true
        
        // top corner radious
    }
    
    //MARK:- View Did Appear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewPager.scrollToPage(index: 0)
        
        headerView.roundCorners(corners: [.topLeft, .topRight], radius: 40.0)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
            
         //   img = UIImageView(frame: newView!.bounds)
            img = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height:  400))
            
            img?.image = UIImage(named: arrSliderImages[index])
            newView?.addSubview(img!)
            
        }else{

        }
               
        return newView!
    }
    
    func didSelectedItem(index: Int) {
        print("select index \(index)")
    }
}


extension HomeTVC
{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 475
        }else{
            return CGFloat(550*arrFoods.count)
        }
    }
}
extension HomeTVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    // MARK: - UICollectionViewDataSource protocol
       
       // tell the collection view how many cells to make
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return 3
       }
       
       // make a cell for each cell index path
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCVCell", for: indexPath as IndexPath) as! HomeCVCell
           
        cell.backView.layer.cornerRadius = 20.0
        cell.backView.clipsToBounds = true
        cell.btn_price.layer.cornerRadius = cell.btn_price.layer.frame.size.height/2
        cell.btn_price.clipsToBounds = true
        
        return cell
       }
       
       // MARK: - UICollectionViewDelegate protocol
       
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           // handle tap events
           print("You selected cell #\(indexPath.item)!")
       }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: itemColView.frame.size.width, height: itemColView.frame.size.width)
    }
}

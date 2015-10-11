//
//  ViewController.swift
//  Arifoglu
//
//  Created by Emirhan Erdogan on 11/10/15.
//  Copyright © 2015 Tutam Gida. All rights reserved.
//

import UIKit

class AnasayfaViewController: UIViewController {

  //Arayüz Elemanları
  @IBOutlet weak var tableview: UITableView!
  
  // Geçici Değişkenler
  var bannerObject1:bannerObject!
  var bannerObject2:bannerObject!
  var bannerObject3:bannerObject!
  var arrayOfBanners = [bannerObject]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Navigationbar için Logo'nun yazısını verir.
    navigationItem.titleView = UIImageView(image: UIImage(named: "ArifogluYazisi"))
    
    //Geçici banner fotograflarını ayarlar
    bannerObject1 = bannerObject(image: UIImage(named: "Banner&Category1"), linkId: 1)
    bannerObject2 = bannerObject(image: UIImage(named: "Banner&Category2"), linkId: 2)
    bannerObject3 = bannerObject(image: UIImage(named: "Banner&Category3"), linkId: 3)

    arrayOfBanners.append(bannerObject1)
    arrayOfBanners.append(bannerObject2)
    arrayOfBanners.append(bannerObject3)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Ram coşarsa =)
  }
}

extension AnasayfaViewController : UITableViewDelegate, UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let bannerCell = tableView.dequeueReusableCellWithIdentifier("Banner") as! BannerTableViewCell
    let normalCell = tableView.dequeueReusableCellWithIdentifier("Normal")!

    if indexPath.row == 0 {
      bannerCell.setupScrollerWithbannerObjects(arrayOfBanners)
      return bannerCell
    }
    return normalCell
  }
  
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    
    //Eğer ilk hücre ise banner hücresidir ve yüksekliği farklı olmalıdır.
    if indexPath.row == 0 {
      // 16 : 9 Aspect Ratio kuralına uyarak hücrenin yüksekliği ayarlanır.
      return view.bounds.width*9/16
    }
    return 44
  }
}





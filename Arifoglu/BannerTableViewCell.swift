//
//  BannerTableViewCell.swift
//  Arifoglu
//
//  Created by Emirhan Erdogan on 11/10/15.
//  Copyright © 2015 Tutam Gida. All rights reserved.
//

import UIKit

public struct bannerObject {
  
  var image : UIImage?
  var linkId : Int?
  
}

class BannerTableViewCell: UITableViewCell {

  //Arayüz Elemanları
  @IBOutlet weak var bannerScroller: UIScrollView!
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var blackLayer: UIView!
  
  //Değişkenler
  var currentOffset:CGFloat = 187.5
  let gradientBlackLayer = CAGradientLayer()

  override func awakeFromNib() {
      super.awakeFromNib()
      bannerScroller.delegate = self
      
  }

  override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
  }
  
  func setupScrollerWithbannerObjects(bannerObjects:[bannerObject]) {
    
    var currentX:CGFloat = 0.0
    let imageWidth =  UIScreen.mainScreen().bounds.width
    bannerScroller.contentSize = CGSize(width: UIScreen.mainScreen().bounds.width*CGFloat(bannerObjects.count), height: 0.0)

    for object in bannerObjects {
      
      //Her bir gelen banner objesi için bir UIImageView oluştur
      let bannerImage = UIImageView(frame: CGRect(x: currentX, y: 0.0, width: imageWidth, height:UIScreen.mainScreen().bounds.width*9/16))
      bannerImage.image = object.image!
      bannerImage.contentMode = UIViewContentMode.ScaleAspectFit
      bannerScroller.addSubview(bannerImage)
      //Güncel yatay pozisyonu gelen fotoğrafın eni ile artır
      currentX += imageWidth
      
    }
  }
  
}

extension BannerTableViewCell : UIScrollViewDelegate {
  
  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.mainScreen().bounds.width)
  }
  
}

//----------------------------------------------------------------------------------------------------

@IBDesignable public class EmrGradientView : UIView {
  
  @IBInspectable var startColor: UIColor = UIColor.whiteColor() {
    didSet{
      configureGradientView()
    }
  }
  
  @IBInspectable var endColor: UIColor = UIColor.blackColor() {
    didSet{
      configureGradientView()
    }
  }
  
  @IBInspectable var isHorizontal: Bool = false {
    didSet{
      configureGradientView()
    }
  }
  
  // MARK: Override Fonk ******************************************
  
  override public class func layerClass()->AnyClass{
    return CAGradientLayer.self
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureGradientView()
  }
  
  required public init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    configureGradientView()
  }
  
  // MARK: İçerideki fonksiyonlar *********************************
  
  // View görünümünü ayarlar
  private func configureGradientView() {
    
    let colors:Array = [startColor.CGColor, endColor.CGColor]
    gradientLayer.colors = colors
    
    if (isHorizontal){
      gradientLayer.endPoint = CGPoint(x: 1, y: 0)
    }else{
      gradientLayer.endPoint = CGPoint(x: 0, y: 1)
    }
    self.setNeedsDisplay()
  }
  
  // Main Layer'ın CAGradientLayer olarak dönmesine yardım ediyor
  var gradientLayer: CAGradientLayer {
    return layer as! CAGradientLayer
  }
  
}





  
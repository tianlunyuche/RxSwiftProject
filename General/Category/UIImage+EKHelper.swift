//
//  UIImage+EKHelper.swift
//  EKParent
//
//  Created by 赵庄鑫 on 2018/2/14.
//  Copyright © 2018 赵庄鑫. All rights reserved.
//

typealias EKAsset = UIImage.Asset

import Foundation
import UIKit

extension UIImage {
    enum Asset : String {
        case Add_friend_icon = "ekw_login_bg"
        
        var image : UIImage {
            return UIImage(asset: self)
        }
    }
    
    convenience init!(asset: Asset) {
        self.init(named: asset.rawValue)
    }
}

//
//  User.swift
//  SFWeiBo
//
//  Created by mac on 16/4/20.
//  Copyright © 2016年 ShaoFeng. All rights reserved.
//

import UIKit

class User: NSObject {

    /// 用户ID
    var id: Int = 0
    /// 友好显示名称
    var name: String?
    /// 用户头像地址（中图），50×50像素
    var profile_image_url: String? {
        didSet {
            if let urlStr = profile_image_url {
                imageUrl = NSURL(string: urlStr)
            }
        }
    }
    /// 粉丝数
    var followers_count: Int = 0
    /// 关注数
    var friends_count: Int = 0
    /// 认证原因
    var verified_reason: String?
    
    ///用于保存用户头像的URL
    var imageUrl: NSURL?
    /// 时候是认证, true是, false不是
    var verified: Bool = false
    /// 用户的认证类型，-1：没有认证，0，认证用户，2,3,5: 企业认证，220: 达人
    var verified_type: Int = -1 {
        
        //数据请求下来后根据认证类型确定认证图标
        didSet {
            switch verified_type {
                
            case 0:verifiedImage = UIImage(named: "avatar_vip")
            case 2,3,5: verifiedImage = UIImage(named: "avatar_enterprise_vip")
            case 220: verifiedImage = UIImage(named: "avatar_grassroot")
            default: verifiedImage = nil
            }
        }
    }
    ///保存当前用户的认证图片
    var verifiedImage: UIImage?
    ///会员等级图像,如果属性是内置类型，必须指定初始值，不然不会分配内存空间，无法被赋值
    var mbrank: Int = 0 {
        didSet {
            if mbrank > 0 && mbrank < 7 {
                mbrankImage = UIImage(named: "common_icon_membership_level" + "\(mbrank)")
            }
        }
    }
    var mbrankImage: UIImage?
    
    // 字典转模型
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    // 打印当前模型
    var properties = ["id", "name", "profile_image_url", "verified", "verified_type"]
    override var description: String {
        let dict = dictionaryWithValuesForKeys(properties)
        return "\(dict)"
    }
}

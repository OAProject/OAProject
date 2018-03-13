//
//  LoginModel.swift
//  SwiftProducts
//
//  Created by wzk on 2018/3/13.
//  Copyright © 2018年 wzk. All rights reserved.
//

import UIKit
import ObjectMapper

class LoginModel: Mappable {
    required init(map: Map) {

    }
    func mapping(map: Map) {
        code <- map["code"]
        data <- map["data"]
        
    }
/*
     {
     "code": 1,
     "data": {
     "id": 1,
     "name": "pony",
     "pwd": "123456",
     "age": 27,
     "sex": "0",
     "idCard": "123456789098765",
     "staffNum": "123456789110",
     "phone": "18300617143",
     "department": "技术部",
     "post": "高级iOS开发工程师",
     "headImagePatch": "http://patch/userid/images",
     "telephone": "18300617143",
     "mail": "1477867638@qq.com",
     "bossName": "张锐",
     "bossid": "110"
     }
     }
 */
    var code: Int?
    var data: UserModel?
    
    
}
class UserModel: Mappable {
    required init(map: Map) {
        
        
    }
    func mapping(map: Map) {
        
        id <- map["id"]
        name <- map["name"]
        pwd <- map["pwd"]
        age <- map["age"]
        sex <- map["sex"]
        idCard <- map["idCard"]
        staffNum <- map["staffNum"]
        phone <- map["phone"]
        department <- map["department"]
        post <- map["post"]
        headImagePatch <- map["headImagePatch"]
        telephone <- map["telephone"]
        mail <- map["mail"]
        bossName <- map["bossName"]
        bossid <- map["bossid"]
    }
    
    var id = 0
    var name = ""
    var pwd = ""
    var age = 0
    var sex = ""
    var idCard = ""
    var staffNum = ""
    var phone = ""
    var department = ""
    var post = ""
    var headImagePatch = ""
    var telephone = ""
    var mail = ""
    var bossName = ""
    var bossid = ""
    
    
    
}

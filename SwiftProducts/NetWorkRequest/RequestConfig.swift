//
//  RequestConfig.swift
//  SwiftProducts
//
//  Created by wzk on 2018/3/13.
//  Copyright © 2018年 wzk. All rights reserved.
//

import UIKit

class RequestConfig: NSObject {
    //公共请求参数：
    let APPKEY = "" // 系统分配的应用程序标识
    let SIGN = "" // 签名
    let TIMESTAMP = "" // 时间戳
    let VERSION = "" // API版本
    let USERID = "" // 当前操作用户(账号字符)
    let ACCESSTOKEN = "" // Token
    let DEVICEVERSION = "" //设备版本
    let IMEI = "" //手机唯一标示
    
    //公共响应参数：
    let BODY = "" // 业务实体内容
    let RESPONSESTATUS = "" // 响应状态
    let ELAPSETIME = "" // 消耗时间
    let ERRORCODE = "" // 错误代码
    let ERRORMESSAGE = "" // 错误消息
    
    public static let urlString = "http://10.7.6.201:8080"
    
    
    public static let loginPath = "/OAProject/doLogin"
    
}

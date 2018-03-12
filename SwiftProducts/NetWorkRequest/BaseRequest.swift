//
//  QLRequest.swift
//  QTimelyLoan
//
//  Created by Sulei Qin on 16/9/26.
//  Copyright © 2016年 Jingnan Zhang. All rights reserved.
//

import UIKit
import Alamofire

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

//MARK:-
//闭包定义：类似于OC中的typedef
typealias resSuccessClosure = (_ bodyObject:AnyObject)->Void
typealias resFailClosure = (_ error:NSError)->Void

//MARK:-

class BaseRequest: NSObject,UIAlertViewDelegate {
    var upLoadURL = ""
    let url = NSURL(string: "")
    // POST 方式：
    func postRequest(url:String, params:[String: AnyObject]?,success:@escaping resSuccessClosure,fail:@escaping resFailClosure) -> Void {
       // /*
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let config:URLSessionConfiguration = URLSessionConfiguration.default
        
        //设置超时时间为15S
//        config.timeoutIntervalForRequest = 30
        //根据config创建manager
        let manger = SessionManager(configuration: config, delegate: self, serverTrustPolicyManager: ServerTrustPolicyManager(policies: ServerTrustPolicy))
        
        
        let dataRequest: DataRequest? = (manger.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: ["Content-Type": "application/x-www-form-urlencoded"]))
        if (dataRequest != nil) {
            dataRequest?.responseJSON{ (response) in
                if(response.error == nil){
                    print("请求成功")
                    print(response.result.value as AnyObject)
//                    success(response.result.value as AnyObject)
                }else{
                    print("请求失败\(String(describing: response.error))")
                }
                
            }
        }
 
        /*
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            if(response.error == nil){
                print("请求成功")
                print(response.result.value)
            }else{
                print("请求失败\(String(describing: response.error))")
            }
            
        }
        */
    }

    // GET 方式：
    func getRequest(url:String, params:[String: AnyObject]?,successAction:@escaping resSuccessClosure,failAction:@escaping resFailClosure) -> Void
    {
        Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
                //                debugPrint(response)
            if(response.error == nil){
                print("请求成功")
                print(response.result.value as AnyObject)
            }else{
                print("请求失败\(String(describing: response.error))")
            }
        }
        
    }
}

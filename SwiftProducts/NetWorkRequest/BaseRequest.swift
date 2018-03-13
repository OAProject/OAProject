//
//  QLRequest.swift
//  QTimelyLoan
//
//  Created by Sulei Qin on 16/9/26.
//  Copyright © 2016年 Jingnan Zhang. All rights reserved.
//

import UIKit
import Alamofire



//MARK:-
//闭包定义：类似于OC中的typedef
typealias resSuccessClosure = (_ bodyObject:AnyObject)->Void
typealias resFailClosure = (_ error:NSError)->Void

//MARK:-

class BaseRequest: NSObject,UIAlertViewDelegate {
    
    // POST 方式：
    func postRequest(url:String, params:[String: AnyObject]?,success:@escaping resSuccessClosure,fail:@escaping resFailClosure) -> Void {
       // /*
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        //根据config创建manager
        let manger = Alamofire.SessionManager.default
        //设置超时时间为60S
        manger.session.configuration.timeoutIntervalForRequest = 60
        
        manger.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: ["Content-Type": "application/x-www-form-urlencoded"]).responseJSON{ (response) in
            if(response.error == nil){
                ConfigPrint.print(response.result.value as AnyObject)
                success(response.result.value as AnyObject)
            }else{
                ConfigPrint.print(response.error! as NSError)
                fail(response.error! as NSError)
            }
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
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
    func getRequest(url:String, params:[String: AnyObject]?,success:@escaping resSuccessClosure,fail:@escaping resFailClosure) -> Void
    {
        Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            if(response.error == nil){
                success(response.result.value as AnyObject)
            }else{
                fail(response.error! as NSError)
            }
        }
        
    }
}

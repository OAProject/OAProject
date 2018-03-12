//
//  LoginViewModel.swift
//  SwiftProducts
//
//  Created by wzk on 2018/3/12.
//  Copyright © 2018年 wzk. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    static func isLogin()->Bool{
        var login :Bool = false
        let def :UserDefaults = UserDefaults.standard
        let pwd :String? = def.string(forKey: "pwd")
        if pwd != nil
        {
            login = true
        }
        return login
    }
    static func addLoginVC(){
        if !isLogin() {
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let login = storyboard.instantiateViewController(withIdentifier: "LoginVC")
            let window :UIWindow = UIApplication.shared.keyWindow!
            window.rootViewController!.present(login, animated: true, completion: {
                
            })
        }
    }
    
    func raquestLogin(_ name: String,pwd: String) {
        let request = BaseRequest()
        let dic:[String:AnyObject] = ["name":name as AnyObject,"password":pwd as AnyObject]
        
        request.postRequest(url: "http://10.7.6.201:8080/OAProject/doLogin", params: dic, success: { (object) in
            
        }) { (error) in
            
        }
    }
    
    
    
    

}



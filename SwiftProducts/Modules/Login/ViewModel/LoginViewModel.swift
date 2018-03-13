//
//  LoginViewModel.swift
//  SwiftProducts
//
//  Created by wzk on 2018/3/12.
//  Copyright © 2018年 wzk. All rights reserved.
//

import UIKit
import ObjectMapper
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
    
    func requestLogin(_ name: String? = "",pwd: String? = "") {
        let request = BaseRequest()
        let dic:[String:AnyObject] = ["name":name! as AnyObject,"password":pwd! as AnyObject]
        let urlString = RequestConfig.urlString+RequestConfig.loginPath
        request.postRequest(url: urlString, params: dic, success: { (object) in
            
            let login: LoginModel = Mapper<LoginModel>().map(JSONObject: object)!
            if login.data != nil
            {
                let user: UserModel = login.data!
                print(user.name)
            }
            
        }) { (error) in
            
        }
      
    }
    
    
    
    

}



//
//  ViewController.swift
//  SwiftProducts
//
//  Created by wzk on 2017/6/23.
//  Copyright © 2017年 wzk. All rights reserved.
//Restoration ID 是系统进入后台或者应用被终止，app重新起来时的用于恢复时使用。


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let index: UIButton = UIButton()
        
        let ser : UISwitch = UISwitch()
        
        print(index)
        
    }
    
    func swapTwoValue<T>(a : T,b : T){
        print("\(a)\(b)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class FanXingClass<TCLSS> {
    var admin:TCLSS?
    
    func names(a:TCLSS)  {
        
    }
}


//
//  BaseTabViewController.swift
//  SwiftProducts
//
//  Created by wzk on 2018/1/8.
//  Copyright © 2018年 wzk. All rights reserved.
//

import UIKit
class BaseTabViewController: NormalTabBarController {

    override func viewDidLoad() {
        coller_Views = [ContactViewController(),MainViewController(),MineViewController()];
        titles = [ConfigStings.contact,ConfigStings.home,ConfigStings.mine]
        unSelect_Image_Names = ["tongxunlu","home","wode"];
        select_Image_Names = ["tongxunlufan","homefan","wodefan"];
        title_Colors = [UIColor.gray,UIColor.gray,UIColor.gray]
        title_Select_Colors = [UIColor.blue,UIColor.blue,UIColor.blue]
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

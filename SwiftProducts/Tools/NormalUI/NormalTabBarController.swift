//
//  BaseTabBarController.swift
//  SwiftProducts
//
//  Created by wzk on 2017/12/5.
//  Copyright © 2017年 wzk. All rights reserved.
//

import UIKit

class NormalTabBarController: UITabBarController {
    
    public var tint_Color: UIColor?
    public var background_Color: UIColor?
    
    public var coller_Views: [UIViewController]?
    public var titles:[String]?
    public var unSelect_Image_Names:[String]?
    public var select_Image_Names:[String]?
    public var title_Colors:[UIColor]?
    
    public var title_Select_Colors:[UIColor]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tabBar.backgroundColor = (background_Color != nil) ? background_Color!:UIColor.white
        tabBar.tintColor = (tint_Color != nil) ? tint_Color!:UIColor.white
        
        dataChangeForTab()
    }
    private func dataChangeForTab()
    {
        if (coller_Views == nil) {
            return
        }
        if (titles!.count < coller_Views!.count)||(unSelect_Image_Names!.count < coller_Views!.count)||(select_Image_Names!.count < coller_Views!.count)||(title_Colors!.count < coller_Views!.count)||(title_Select_Colors!.count<coller_Views!.count) {
            return
        }
        for index in 1...coller_Views!.count {
            let i : Int = index-1;
            let vc: UIViewController = coller_Views![i];
            let title: String? = titles![i]
            let unSelectImageString: String? = unSelect_Image_Names![i];
            let selectImageString: String? = select_Image_Names![i];
            let selectColor:UIColor? = title_Select_Colors?[i]
            let uncolor = title_Colors?[i]
            
            createTabBarItem(vc:vc,title: title, unSelectedImageString: unSelectImageString, selectedImageString: selectImageString,nucolor:uncolor,selectColor:selectColor, tag: i)
            
        }
    }
    private func createTabBarItem(vc:UIViewController?,title: String?,unSelectedImageString: String?,selectedImageString: String?,nucolor:UIColor?,selectColor:UIColor?,tag:Int) -> Void {
        let unSelectImage: UIImage = UIImage(named: unSelectedImageString!)!
        let selectImage: UIImage = UIImage(named: selectedImageString!)!
        
        let item :UITabBarItem = tabBar.items![tag]
        item.title = title
        item.selectedImage = selectImage
        item.image = unSelectImage
        item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: selectColor!], for: .selected)
        item.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: nucolor!], for:.normal)
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

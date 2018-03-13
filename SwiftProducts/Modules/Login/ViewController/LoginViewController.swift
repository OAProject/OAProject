//
//  LoginViewController.swift
//  SwiftProducts
//
//  Created by wzk on 2018/3/12.
//  Copyright © 2018年 wzk. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let viewModel: LoginViewModel = LoginViewModel()
    @IBOutlet weak var labelNumberID: BaseLabel!
    @IBOutlet weak var labelPwd: BaseLabel!
    @IBOutlet weak var textNumberID: UITextField!
    @IBOutlet weak var textPwd: UITextField!
    @IBOutlet weak var buttonLogin: BaseButton!
    //便利构造器，LoginViewController()  默认会掉这个方法
//    convenience init() {
//        self.init(nibName: "", bundle: nil)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelNumberID.text = ConfigStings.numberID + ConfigStings.maohao
        labelPwd.text = ConfigStings.pwd + ConfigStings.maohao
        buttonLogin.setTitle(ConfigStings.login, for: .normal)

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(LoginViewController.tappedView))
        view.addGestureRecognizer(tap)
    }
    @objc func tappedView(_ tapView: UITapGestureRecognizer) {
        textNumberID.resignFirstResponder()
        textPwd.resignFirstResponder()
    }
    @IBAction func selectLoginButton(_ sender: Any) {
//        viewModel.raquestLogin("pony", pwd: "123456")
        viewModel.requestLogin(textNumberID.text, pwd: textPwd.text)
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


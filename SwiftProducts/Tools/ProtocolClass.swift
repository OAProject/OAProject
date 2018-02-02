//
//  ProtocolClass.swift
//  SwiftProducts
//
//  Created by wzk on 2018/2/1.
//  Copyright © 2018年 wzk. All rights reserved.
//

import UIKit

protocol Normal {
    func eats<Food>(food:Food) -> Void
}
protocol Student{
    func play<Goods>(item:Goods) -> Void
    
}
protocol Teacher {
    func teach<P>(person:P) -> Void 
}



//
//  Meeting.swift
//  SwiftProducts
//
//  Created by wzk on 2018/2/1.
//  Copyright © 2018年 wzk. All rights reserved.
//

import UIKit

class Meeting: NSObject {
    let office = Office()
    
    func startMeeting() {
        
        office.play(item: "Goods")
    }
}

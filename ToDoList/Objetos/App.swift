//
//  App.swift
//  ToDoList
//
//  Created by mac13 on 18/02/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

class App: NSObject {
    static let shared = App()
    let defaults = UserDefaults.standard
    var tasks =  [Task]()
    
}

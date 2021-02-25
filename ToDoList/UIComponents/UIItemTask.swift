//
//  UIItemTask.swift
//  ToDoList
//
//  Created by mac13 on 18/02/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

class UIItemTask: UIView {
   
    private var labelText: UILabel!
    private var checkbox:CheckBox!
    public private(set) var task:Task!
    public var _delegate:TaskDelegate?
    
    func build(index:Int,_ task:Task){
        labelText = UILabel(frame: CGRect(x: 10, y: 0, width: self.frame.size.width, height: self.frame.size.height))
        labelText.text = task.name.uppercased()
        labelText.textColor = UIColor.link
        labelText.font = UIFont(name: "Arial Bold", size: 14.0)
        
        checkbox = CheckBox.init()
        checkbox.tag = index
        checkbox.frame = CGRect(x: self.frame.size.width-75, y: self.frame.height-75, width: 50, height: 50)
        checkbox.style = .tick
        checkbox.borderStyle = .roundedSquare(radius: 3)
        checkbox.addTarget(self, action: #selector(onCheckedChanged (_:)), for: .valueChanged)
        self.backgroundColor = UIColor.white
        self.addSubview(labelText)
        self.addSubview(checkbox)
    }
    
    @objc func onCheckedChanged(_ sender:CheckBox){
        if sender.isChecked {
            print("A")
            let task = App.shared.tasks[sender.tag]
            task.wasDone(index: sender.tag)
        }
        _delegate?.onChangeDone()
    }
}

//
//  TaskViewController.swift
//  ToDoList
//
//  Created by mac13 on 18/02/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet var tf_name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    @IBAction func save(_ sender: Any) {
        if !tf_name.text!.isEmpty{
            let task = Task(tf_name.text!, done: false)
            task.add(){
                self.navigationController?.popViewController(animated: true)
            }
        }else {
            self.alertDefault(with: "Error", andWithMag: "Los campos no pueden ir vacios")
        }
    }
}

//
//  ViewController.swift
//  ToDoList
//
//  Created by mac13 on 18/02/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, TaskDelegate {

    @IBOutlet var scListTask: UIScrollView!
    @IBOutlet var svListTask: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    /*override func viewWillDisappear(_ animated: Bool) {
        
    }*/
    
    func loadData() {
        emptyStackView()
        let height = 100
        let spacing = 10
        var positionY = 0
        App.shared.tasks = Task.all()
        if App.shared.tasks.count > 0 {
            var i = 0
            App.shared.tasks.filter( {$0.done == false} ).forEach { (task) in
                let itemTask = UIItemTask(frame: CGRect(x: 0, y: positionY, width: Int(self.view.frame.size.width), height: height))
                itemTask.build(index: i, task)
                itemTask._delegate = self
                self.svListTask.addSubview(itemTask)
                i += 1
                positionY += height + spacing
            }
            
            scListTask.contentSize.height = CGFloat(App.shared.tasks.count * (height + spacing))
        }
    }
    
    @IBAction func willAdd(_ sender: Any) {
        self.performSegue(withIdentifier: "sgTaskform", sender: nil)
    }
    
    func emptyStackView(){
        self.svListTask.subviews.forEach{(itemtask) in itemtask.removeFromSuperview()}
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Aparecio")
        loadData()
    }
    
    func onChangeDone(){
        print("done hecho")
        self.loadData()
    }
    
}
extension UIViewController{
    func alertDefault(with tittle:String, andWithMag description:String){
        let alert = UIAlertController(title: tittle, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (a) in alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert,animated: true, completion: nil)
    }
}

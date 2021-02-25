//
//  Task.swift
//  ToDoList
//
//  Created by mac13 on 18/02/21.
//  Copyright © 2021 UTT. All rights reserved.
//

import UIKit

class Task: Codable {
        
    var id:Int!
    var name:String!
    public private(set) var done:Bool?
    
    init(_ name:String, done:Bool){
        self.name = name
        self.done = done
    }
    
    func store(){
        do{
            let encoder = JSONEncoder()
            let data = try encoder.encode(App.shared.tasks)
            App.shared.defaults.set(data, forKey: "tasks")
            App.shared.defaults.synchronize()
        }catch {
            print("Error serialization \(error)")
        }
    }
    
    func wasDone(index:Int){
        var tasks:[Task] = Task.all()
        if index < tasks.count {
            self.done = true
            tasks[index] = self
            App.shared.tasks = tasks
        }
        self.store()
    }
    
    func add(completion:()->()){
        App.shared.tasks = Task.all()
        
        App.shared.tasks.append(self)
        self.store()
        completion()
    }
    
    static func all() -> [Task]{
        if let data = App.shared.defaults.object(forKey: "tasks") as? Data {
            let decoder = JSONDecoder()
            guard let tasks = try? decoder.decode([ Task].self, from: data) else { return [Task]() }
            return tasks
        }
        return [Task] ()
    }
}

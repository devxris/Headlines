//
//  Source.swift
//  HeadlinesApp
//
//  Created by Chris Huang on 28/1/18.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

class Source {
    
    var id :String
    var name :String
    var description :String
    
    init(id :String, name :String, description :String) {
        self.id = id
        self.name = name
        self.description = description 
    }
    
    
    init?(dictionary :[String:Any]) {
        
        guard let id = dictionary["id"] as? String,
              let name = dictionary["name"] as? String,
            let description = dictionary["description"] as? String else {
                return nil
        }
        
        self.id = id
        self.name = name
        self.description = description
    }
}



//
//  Headline.swift
//  HeadlinesApp
//
//  Created by Chris Huang on 28/1/18.
//  Copyright © 2018 Chris Huang. All rights reserved.
//

import Foundation

class Headline {

    var title :String!
    var description :String!

    init?(dictionary :[String:Any]) {

        guard let title = dictionary["title"] as? String,
            let description = dictionary["description"] as? String else {
                return nil
        }

        self.title = title
        self.description = description
    }
}

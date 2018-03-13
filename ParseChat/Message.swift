//
//  Message.swift
//  ParseChat
//
//  Created by Sijin Wang on 3/13/18.
//  Copyright © 2018 Sijin Wang. All rights reserved.
//

import Foundation
import Parse

class Message: PFObject, PFSubclassing {
    
    @NSManaged var author: PFUser
    @NSManaged var message: String
    
    static func parseClassName() -> String {
        return "Message"
    }
    
}

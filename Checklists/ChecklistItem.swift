//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Roberto Edgar Geiss on 18/08/2018.
//  Copyright © 2018 Roberto Edgar Geiss. All rights reserved.
//

import Foundation

class ChecklistItem
{
    var text: String = ""
    var checked: Bool = false
    
    func Toggle()
    {
        checked = !checked
    }
    
}

//
//  ViewController.swift
//  Checklists
//
//  Created by Roberto Edgar Geiss on 16/08/2018.
//  Copyright © 2018 Roberto Edgar Geiss. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        return cell
    }

    
}










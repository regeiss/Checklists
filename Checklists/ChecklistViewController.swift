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

    let row0Text: String = "Linha0"
    let row1Text: String = "Linha1"
    let row2Text: String = "Linha2"
    let row3Text: String = "Linha3"
    let row4Text: String = "Linha4"
    
    var row0Checked: Bool = false
    var row1Checked: Bool = false
    var row2Checked: Bool = false
    var row3Checked: Bool = false
    var row4Checked: Bool = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // Tap na celula da tabela
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if let cell = tableView.cellForRow(at: indexPath)
        {
            var isChecked: Bool = false
            
            if indexPath.row == 0
            {
                row0Checked = !row0Checked
                isChecked = row0Checked
            }
            else if indexPath.row == 1
            {
                row1Checked = !row1Checked
                isChecked = row1Checked
            }
            else if indexPath.row == 2
            {
                row2Checked = !row2Checked
                isChecked = row2Checked
            }
            else if indexPath.row == 3
            {
                row3Checked = !row3Checked
                isChecked = row3Checked
            }
            else if indexPath.row == 4
            {
                row4Checked = !row4Checked
                isChecked = row4Checked
            }
        
            if isChecked
            {
               cell.accessoryType = .checkmark
            }
            else
            {
                cell.accessoryType = .none
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Determina o n[umero de linhas na tabela
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    // Trata o conteúdo de cada linha
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0
            {label.text = row0Text}
        if indexPath.row % 5 == 1
            {label.text = row1Text}
        if indexPath.row % 5 == 2
            {label.text = row2Text}
        if indexPath.row % 5 == 3
            {label.text = row3Text}
        if indexPath.row % 5 == 4
            {label.text = row4Text}
        
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }

    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath)
    {
        var isChecked: Bool = false
        if indexPath.row == 0
        {
            isChecked = row0Checked
        }
        if indexPath.row == 1
        {
            isChecked = row1Checked
        }
        if indexPath.row == 2
        {
            isChecked = row2Checked
        }
        if indexPath.row == 3
        {
            isChecked = row3Checked
        }
        if indexPath.row == 4
        {
            isChecked = row4Checked
        }
        
        if isChecked
        {
            cell.accessoryType = .checkmark
        }
        else
        {
            cell.accessoryType = .none
        }
    }
}






































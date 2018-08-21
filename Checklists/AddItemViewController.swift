//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Roberto Edgar Geiss on 20/08/2018.
//  Copyright © 2018 Roberto Edgar Geiss. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate
{

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        textField.delegate = self
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem)
    {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: UIBarButtonItem)
    {
        navigationController?.popViewController(animated: true)
    }
    


    // Seta o campode texto como FR
    override func viewWillAppear(_ animated: Bool)
    {
        textField.becomeFirstResponder()
    }
    
}

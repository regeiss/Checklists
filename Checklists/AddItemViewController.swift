//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Roberto Edgar Geiss on 20/08/2018.
//  Copyright © 2018 Roberto Edgar Geiss. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class
{
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishedAdding item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate
{

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewController?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        //textField.delegate = self
    }
    
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return false
    }
    */
    // Fecha a view
    @IBAction func cancel(_ sender: UIBarButtonItem)
    {
        navigationController?.popViewController(animated: true)
        //delegate?.addItemViewControllerDidCancel(self)
    }
    @IBAction func endEdit(_ sender: UITextField)
    {
        navigationController?.popViewController(animated: true)
    }
    
    // Fecha a view
    @IBAction func done(_ sender: UIBarButtonItem)
    {
        navigationController?.popViewController(animated: true)
    }
    
    // Evita selecao da linha
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?
    {
        return nil
    }
    
    // Seta o campode texto como FR
    override func viewWillAppear(_ animated: Bool)
    {
        textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)
        let newText = oldText.replacingCharacters(in: stringRange!, with: string)
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
    }
    /*func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        

    }
*/
}

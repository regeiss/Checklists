//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Roberto Edgar Geiss on 20/08/2018.
//  Copyright © 2018 Roberto Edgar Geiss. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: ItemDetailViewController)
    func addItemViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    func addItemViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}


class ItemDetailViewController: UITableViewController, UITextFieldDelegate
{

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    var itemToEdit: ChecklistItem?
    
    weak var delegate: ItemDetailViewControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit
        {
            title = "Edit item"
            textField.text = item.text
            doneBarButton.isEnabled = true 
        }
    }
    
    // Fecha a view
    @IBAction func cancel(_ sender: UIBarButtonItem)
    {
        navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCancel(self)
    }
    @IBAction func endEdit(_ sender: UITextField)
    {
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        delegate?.addItemViewController(self, didFinishEditing: itemToEdit!)
    }

   // Fecha a view
    @IBAction func done(_ sender: UIBarButtonItem)
    {
        if let itemToEdit = itemToEdit
        {
            itemToEdit.text = textField.text!
            delegate?.addItemViewController(self, didFinishEditing: itemToEdit)
        }
        else
        {
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            delegate?.addItemViewController(self, didFinishAdding: item)
        }
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)
        let newText = oldText.replacingCharacters(in: stringRange!, with: string)
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        }
        else
        {
            doneBarButton.isEnabled = true
        }
        return true
    }
}

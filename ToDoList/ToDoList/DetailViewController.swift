//
//  DetailViewController.swift
//  ToDoList
//
//  Created by HsinYuLi on 2018/8/28.
//  Copyright © 2018年 laalee. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTextView: UITextView!
    
    var addHandler: ((String) -> Void)?
    
    var editHandler: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContent()
    }
    
    func setContent() {
        
        if detailTextView.text == "" {
            
            self.title = "Add"

        } else {
            
            self.title = "Edit"
        }
    }

    @IBAction func cancelButtonClick(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonClick(_ sender: UIButton) {
        
        guard let text = detailTextView.text else { return }
        
        self.navigationController?.popViewController(animated: true)
        
        if let handler = addHandler {
            
            handler(text)
            
        } else {
            
            editHandler?(text)
        }
        
        
    }
    
}

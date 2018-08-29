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
    
    @objc dynamic var itemDetail: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContent()
    }
    
    func setContent() {
        
        if let itemDetail = itemDetail {
            
            self.title = "Edit"
            
            detailTextView.text = itemDetail
            
        } else {
            
            self.title = "Add"
        }
    }

    @IBAction func cancelButtonClick(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonClick(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
        if let itemText = detailTextView.text {
            
            itemDetail = itemText.trimmingCharacters(in: .whitespaces)
        }
    }
    
}

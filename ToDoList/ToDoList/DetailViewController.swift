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
    
    var itemDetail: String?
    
    weak var delegate: todoListDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setContent()
    }
    
    func setContent() {
        
        if let itemDetail = itemDetail {
            
            self.title = "Edit"
            
            detailTextView.text = itemDetail
            
        } else {
            
            self.title = "Add"
            
            detailTextView.text = ""
        }
    }

    @IBAction func cancelButtonClick(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveButtonClick(_ sender: UIButton) {
        
        itemDetail = detailTextView.text
        
        itemDetail = itemDetail?.trimmingCharacters(in: .whitespaces)
        
        self.navigationController?.popViewController(animated: true)
        
        delegate?.saveTodoIetm(todoItem: itemDetail ?? "")
    }
    
}

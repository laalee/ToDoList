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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func cancelButtonClick(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

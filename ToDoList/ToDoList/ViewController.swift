//
//  ViewController.swift
//  ToDoList
//
//  Created by HsinYuLi on 2018/8/28.
//  Copyright © 2018年 laalee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    var todolist: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uiNib = UINib(nibName: "ListTableViewCell", bundle: nil)
        listTableView.register(uiNib, forCellReuseIdentifier: "cell")
        
        listTableView.dataSource = self
        listTableView.delegate = self
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todolist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = listTableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
            ) as? ListTableViewCell else {
                
                return UITableViewCell()
        }
        
        cell.setListItem(item: todolist[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            todolist.remove(at: indexPath.row)
            
            listTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}

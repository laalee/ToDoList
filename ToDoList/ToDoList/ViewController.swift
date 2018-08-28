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
        
    var todoList: [String] = []
    
    var editItemIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uiNib = UINib(nibName: "ListTableViewCell", bundle: nil)
        listTableView.register(uiNib, forCellReuseIdentifier: "cell")
        
        listTableView.dataSource = self
        listTableView.delegate = self
    }
    
    @IBAction func addButtonClick(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "goDetail", sender: nil)
    }
    
    @objc func editButtonClick(sender: UIButton) {
        
        self.performSegue(withIdentifier: "goDetail", sender: sender.tag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goDetail" {

            guard let controller = segue.destination as? DetailViewController else { return }
            
            controller.completionHandler = { todoItem in
                
                self.saveTodoIetm(todoItem: todoItem)
                
            }
            
            if let tag = sender as? Int {
                
                controller.itemDetail = todoList[tag]
                
                editItemIndex = tag
            }
        } 
    }
    
    func saveTodoIetm(todoItem: String) {
        
        guard todoItem != "" else {
            
            showToast()
            
            return
        }
        
        if let index = editItemIndex {
            
            todoList[index] = todoItem
            
            editItemIndex = nil
            
        } else {
            
            todoList.append(todoItem)
        }
        
        listTableView.reloadData()
    }
    
    func showToast() {
        
        let alertToast = UIAlertController(title: "Save failed!", message: "Content should not be blank.", preferredStyle: .alert)
        
        present(alertToast, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            alertToast.dismiss(animated: false, completion: nil)
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = listTableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
            ) as? ListTableViewCell else {
                
                return UITableViewCell()
        }
        
        cell.setListItem(item: todoList[indexPath.row])
        
        cell.editButton.tag = indexPath.row
        
        cell.editButton.addTarget(self, action: #selector(editButtonClick(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        
        return "Delete"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            todoList.remove(at: indexPath.row)
            
            listTableView.deleteRows(at: [indexPath], with: .automatic)
            
            listTableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
}

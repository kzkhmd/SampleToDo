//
//  TasksTableViewController.swift
//  SampleToDo
//
//  Created by 濱田一輝 on 2020/08/02.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import UIKit

class TasksTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter
    }()
    
    private var projectList = ProjectsList.shared
    
    var project: Project!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onTapAddButton(_:)))
        
        self.navigationItem.rightBarButtonItem = addButton
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.allowsSelection = false
        self.tableView.register(UINib(nibName: "TaskTableViewCell", bundle: nil), forCellReuseIdentifier: "TaskTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TaskDetailViewSegue" {
            let nextViewController = segue.destination as! TaskDetailViewController
            
            nextViewController.project = self.project
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                nextViewController.task = self.project.tasks[indexPath.row]
            }
        }
    }
    
    @objc func onTapAddButton(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "TaskDetailViewSegue", sender: nil)
    }
}


//MARK: - UITableViewDataSource

extension TasksTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return project.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as! TaskTableViewCell
        let task = project.tasks[indexPath.row]
        
        cell.taskName.text = task.name
        cell.deadline.text = dateFormatter.string(from: task.deadline)
        
        return cell
    }
    
}


//MARK: - UITableViewDelegate

extension TasksTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.project.tasks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

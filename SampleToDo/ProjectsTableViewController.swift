//
//  ProjectsTableViewController.swift
//  SampleToDo
//
//  Created by 濱田一輝 on 2020/06/24.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import UIKit

class ProjectsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        return dateFormatter
    }()
    
    private var projectsList = ProjectsList.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(onTapAddButton(_:)))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        /* editButtonItemを使用すると、ボタンの名前が自動的にEdit⇄Doneで遷移する*/
        let editButton = editButtonItem
        
        self.navigationItem.rightBarButtonItem = editButton
        self.toolbarItems = [flexibleSpace, addButton]
        
        self.tableView.register(UINib(nibName: "ProjectTableViewCell", bundle: nil), forCellReuseIdentifier: "ProjectTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProjectDetailViewSegue" {
            let nextViewController = segue.destination as! ProjectDetailViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                nextViewController.project = self.projectsList.projects[indexPath.row]
            }
        } else if segue.identifier == "TasksTableViewSegue" {
            let nextViewController = segue.destination as! TasksTableViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                nextViewController.project = self.projectsList.projects[indexPath.row]
            }
        }
    }
    
    /* editButtonItemを押すと呼ばれる */
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        self.tableView.setEditing(editing, animated: animated)
    }
    
    @objc func onTapAddButton(_ sender: Any) {
        self.performSegue(withIdentifier: "ProjectDetailViewSegue", sender: nil)
    }
    
}


//MARK: - UITableViewDataSource

extension ProjectsTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectsList.projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectTableViewCell") as! ProjectTableViewCell
        let project = projectsList.projects[indexPath.row]
        
        cell.projectName.text   = project.name
        cell.deadline.text      = dateFormatter.string(from: project.deadline!)
        cell.progressRate.text  = String(project.progressRate)
        cell.taskNumber.text    = String(project.allTaskNumber)
        
        return cell
    }
    
    /* このメソッドを実装することで、並べ替えが可能になる */
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        self.projectsList.move(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
}


//MARK: - UITableViewDelegate

extension ProjectsTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "TasksTableViewSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.projectsList.projects.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}


//MARK: - UICollectionViewDataSource

extension ProjectsTableViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCollectionViewCell", for: indexPath) as! ProjectCollectionViewCell
        
        return cell
    }
}


//MARK: - UICollectionViewDelegate

extension ProjectsTableViewController: UICollectionViewDelegate {
    
}

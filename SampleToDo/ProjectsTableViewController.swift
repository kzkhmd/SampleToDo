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
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(onTapEditButton(_:)))
        
        self.navigationItem.rightBarButtonItem = addButton
        self.navigationItem.leftBarButtonItem = editButton
        
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
                nextViewController.project = projectsList.projects[indexPath.row]
            } else {
                nextViewController.project = Project(projectName: "")
            }
        }
        else if segue.identifier == "TasksTableViewSegue" {
            let nextViewController = segue.destination as! TasksTableViewController
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                nextViewController.project = projectsList.projects[indexPath.row]
            }
        }
    }
    
    @objc func onTapAddButton(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "ProjectDetailViewSegue", sender: nil)
    }
    
    @objc func onTapEditButton(_ sender: UIBarButtonItem) {
        print("EditButton tapped")
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
        
        cell.projectName.text   = project.projectName
        cell.deadline.text      = dateFormatter.string(from: project.deadline!)
        cell.progressRate.text  = String(project.progressRate)
        cell.taskNumber.text    = String(project.allTaskNumber)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}


//MARK: - UITableViewDelegate

extension ProjectsTableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "TasksTableViewSegue", sender: nil)
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

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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "ProjectTableViewCell", bundle: nil), forCellReuseIdentifier: "ProjectTableViewCell")
    }
}


//MARK: - UITableViewDataSource

extension ProjectsTableViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectTableViewCell") as! ProjectTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}


//MARK: - UITableViewDelegate

extension ProjectsTableViewController: UITableViewDelegate {
    
    
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

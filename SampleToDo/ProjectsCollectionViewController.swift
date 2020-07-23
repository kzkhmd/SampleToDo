//
//  ProjectsCollectionViewController.swift
//  SampleToDo
//
//  Created by 濱田一輝 on 2020/07/11.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import UIKit

class ProjectsCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.collectionView.register(UINib(nibName: "ProjectCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProjectCollectionViewCell")
    }
    
}


extension ProjectsCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProjectCollectionViewCell", for: indexPath) as! ProjectCollectionViewCell
        
        return cell
    }
    
}


extension ProjectsCollectionViewController: UICollectionViewDelegate {
    
}


extension ProjectsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 30
        
        return CGSize(width: width, height: 100)
    }
    
}

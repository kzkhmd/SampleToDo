//
//  ProjectDetailViewController.swift
//  SampleToDo
//
//  Created by 濱田一輝 on 2020/07/26.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import UIKit


class ProjectDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTapDoneButton(_ sender: Any) {
        print("done button")
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapCancelButton(_ sender: Any) {
        print("cancel button")
        
        self.dismiss(animated: true, completion: nil)
    }
    
}

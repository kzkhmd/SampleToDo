//
//  ProjectTableViewCell.swift
//  SampleToDo
//
//  Created by 濱田一輝 on 2020/07/11.
//  Copyright © 2020 Kazuki Hamada. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var verticalStack: UIStackView!
    
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var deadline: UILabel!
    @IBOutlet weak var progressRate: UILabel!
    @IBOutlet weak var taskNumber: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}

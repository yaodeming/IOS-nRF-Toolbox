//
//  FileTableViewCell.swift
//  nRF Toolbox
//
//  Created by Nick Kibysh on 27/03/2020.
//  Copyright © 2020 Nordic Semiconductor. All rights reserved.
//

import UIKit

class FileTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var fileImage: UIImageView!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func update(_ model: FSNodeRepresentation) {
        nameLabel.text = model.name
        fileImage.image = model.image
        infoLabel.text = model.sizeInfo
        
        let dafeFormatter = DateFormatter()
        dafeFormatter.timeStyle = .none
        dafeFormatter.dateStyle = .short
        dateLabel.text = model.modificationDate.flatMap { dafeFormatter.string(from: $0) }
        
        contentView.layoutMargins.left = CGFloat(model.level * 16)
        
        if model.node is Directory {
            self.selectionStyle = .none
        } else {
            self.selectionStyle = .default
        }
        
    }
    
}

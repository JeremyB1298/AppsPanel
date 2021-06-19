//
//  EventTableViewCell.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func config(event: Event) {
        self.titleLabel.text = event.title
        self.descriptionLabel.text = event.description
        self.dateLabel.text = event.stringPublichedAt
        if let imageUrl = event.pictureUrl, let data = try? Data(contentsOf: imageUrl) {
            imgView.image = UIImage(data: data)
        }
    }
    
}

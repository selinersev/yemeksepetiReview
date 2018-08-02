//
//  MarkingTagTableViewCell.swift
//  selin
//
//  Created by Selin Ersev on 20.07.2018.
//  Copyright © 2018 Selin Ersev. All rights reserved.
//

import UIKit

class MarkingTagTableViewCell: UITableViewCell {

    @IBAction func openButtonAction(_ sender: Any) {
        guard let urlString = applicationURL, let url = URL(string: urlString) else {return}
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    @IBOutlet weak var openButton: UIButton!
    @IBOutlet weak var markingTagBaseView: UIView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var applicationURL:String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        openButton.layer.cornerRadius = 8
        openButton.layer.masksToBounds = true
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = 8
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populate(with entry:EntryRow){
        applicationURL = entry.link?.attributes.href

        markingTagBaseView.layer.masksToBounds = true
        markingTagBaseView.layer.cornerRadius = 8
        
        let url = URL(string: entry.image![2].label)!
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            DispatchQueue.main.async { // Make sure you're on the main thread here
                self.iconImageView.image = UIImage(data: data)
            }
        }
        task.resume()
        appNameLabel.text = entry.name?.label
        categoryLabel.text = entry.category?.attributes?.label
    }
}

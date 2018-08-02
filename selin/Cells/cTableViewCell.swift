//
//  cTableViewCell.swift
//  selin
//
//  Created by Selin Ersev on 16.07.2018.
//  Copyright © 2018 Selin Ersev. All rights reserved.
//

import UIKit

class cTableViewCell: UITableViewCell {

    
    @IBOutlet weak var starsImageView: UIImageView!
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func populate(with entry: EntryRow){

        baseView.layer.masksToBounds = false
        baseView.layer.shadowOffset = CGSize(width: 0, height: 2)
        baseView.layer.shadowColor = UIColor.black.cgColor
        baseView.layer.shadowOpacity = 0.23
        baseView.layer.shadowRadius = 4
        baseView.layer.cornerRadius = 8
        contentLabel.text = entry.content?.label
        titleLabel.text = entry.title?.label
        authorLabel.text = entry.author?.name?.label
        
        
        if(Int((entry.rating?.label)!) == 1){
            starsImageView.image = #imageLiteral(resourceName: "1")
            
        }
        else if(Int((entry.rating?.label)!) == 2){
            starsImageView.image = #imageLiteral(resourceName: "2")
            
        }
        else if(Int((entry.rating?.label)!) == 3){
            starsImageView.image = #imageLiteral(resourceName: "3")
        }
        else if(Int((entry.rating?.label)!) == 4){
            starsImageView.image = #imageLiteral(resourceName: "4")
        }else{
            starsImageView.image = #imageLiteral(resourceName: "5")
        }
    }
}

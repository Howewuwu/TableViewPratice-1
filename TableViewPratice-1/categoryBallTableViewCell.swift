//
//  PokeItemTableViewCell.swift
//  TableViewPratice-1
//
//  Created by Howe on 2024/2/14.
//

import UIKit

class categoryBallTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var itemImageView: UIImageView!
    
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var detailButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

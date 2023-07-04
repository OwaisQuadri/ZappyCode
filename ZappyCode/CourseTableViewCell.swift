//
//  CourseTableViewCell.swift
//  ZappyCode
//
//  Created by Quadri, Owais on 2023-07-04.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    @IBOutlet weak var courseTitleLabel: UILabel!
    @IBOutlet weak var courseSubtitleLabel: UILabel!
    @IBOutlet weak var courseImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

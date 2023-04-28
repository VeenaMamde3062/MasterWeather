//
//  MyTableViewCell.swift
//  MasterWeather
//
//  Created by user235115 on 4/21/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var mintemp: UILabel!
    @IBOutlet weak var maxtemp: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static var identifier : String {
            return String(describing: self)
        }
        
        static var nib : UINib {
            return UINib.init(nibName: identifier, bundle: nil)
        }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

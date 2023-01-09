//
//  TypeATableViewCell.swift
//  Test
//
//  Created by Josean Donato Jaulis Nina on 28/12/22.
//

import UIKit

class TypeATableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var customImageView: UIImageView! {
        didSet {
            customImageView.image = UIImage(named: "RxSwift_Logo.png")
            print("didSet customImageView")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

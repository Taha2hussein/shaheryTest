//
//  ListTableViewCell.swift
//  viperTest
//
//  Created by A on 07/11/2021.
//

import UIKit
import SDWebImage
class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var ProductTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(from item: ListEntity) {
        
        self.productPrice.text = "\(item.price)"
        self.ProductTitle.text = item.title
        setImage(item.image)
    }
    
    func setImage( _ image:String) {
        ProductImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: ""))

    }
}

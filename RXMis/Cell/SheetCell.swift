//
//  SheetCell.swift
//  RXMis
//
//  Created by 杨洋 on 2021/9/20.
//

import UIKit

class SheetCell: UICollectionViewCell {
    @IBOutlet weak var lbCount: UILabel!
    @IBOutlet weak var lvBanner: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    static let NAME = "SheetCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bindData(_ data: Sheet) {
        lbTitle.text = "1111"
        ViewUtil.showSmallRadius(lvBanner)
    }

}

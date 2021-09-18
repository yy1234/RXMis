//
//  TitleCell.swift
//  RXMis
//  发现页面标题
//  Created by 杨洋 on 2021/9/10.
//

import UIKit

class TitleCell: UICollectionViewCell {
    /// 当前Cell的名称
    @IBOutlet weak var lbTitle: UILabel!
    static let NAME = "TitleCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindData(_ data: String) {
        lbTitle.text = data
    }
}

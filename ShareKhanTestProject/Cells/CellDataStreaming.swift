//
//  CellDataStreaming.swift
//  ShareKhanTestProject
//
//  Created by Amey Dalvi on 27/05/24.
//

import UIKit

class CellDataStreaming: UITableViewCell {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var tfDataStreaming: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

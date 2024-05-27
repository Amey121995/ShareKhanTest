//
//  CellSliderForFonts.swift
//  ShareKhanTestProject
//
//  Created by Amey Dalvi on 27/05/24.
//

import UIKit

class CellSliderForFonts: UITableViewCell {

    @IBOutlet var viewSlider: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var sliderFont: UISlider!
    
    @IBOutlet var viewAppFont: UIView!
    
    @IBOutlet var viewAppReport: UIView!
    
    @IBOutlet var lblOptions: UILabel!
    @IBOutlet var lblDateFormat: UILabel!
    
    @IBOutlet var lblOptionValue: UILabel!
    @IBOutlet var lblOptionValue2: UILabel!
    
    
    @IBOutlet var lblReport1: UILabel!
    @IBOutlet var lblReport2: UILabel!
    @IBOutlet var lblReport3: UILabel!
    @IBOutlet var lblReport4: UILabel!
    @IBOutlet var lblReport5: UILabel!
    @IBOutlet var lblReport6: UILabel!
    @IBOutlet var lblReport7: UILabel!
    @IBOutlet var lblReport8: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        
       
        
        //self.adjustFontSize(for: self.lblOptions, withMultiplier: Property.shared.fontSizeApp, baseFontSize: self.lblOptions.font.pointSize)
        
        
     
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func adjustFontSize(for label: UILabel, withMultiplier multiplier: CGFloat, baseFontSize: CGFloat) {
          let newSize = baseFontSize * multiplier
          label.font = label.font.withSize(newSize)
      }
}

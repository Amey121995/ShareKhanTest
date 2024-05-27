//
//  ViewController.swift
//  ShareKhanTestProject
//
//  Created by Amey Dalvi on 27/05/24.
//

import UIKit

struct ItemData{
    
    var id: String?
    var Name: String?
    var type: String?
    init(id: String? = nil, Name: String? = nil, type: String? = nil) {
        self.id = id
        self.Name = Name
        self.type = type
    }
    
}

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var arrProperty = [ItemData(id: "data_streaming", Name: "Data String", type: "Int"),
                       ItemData(id: "session_validation", Name: "Session Validation", type: "Int"),
                       ItemData(id: "push_notification", Name: "Push Notification", type: "Bool"),
                       ItemData(id: "dnd_notification", Name: "DND Notification", type: "Bool"),
                       ItemData(id: "order_confirmation", Name: "Order Confirmation", type: "Bool"),
                       ItemData(id: "trading_view", Name: "Trading View Chart", type: "Bool"),
                       ItemData(id: "font_size_app", Name: "Font Size - App", type: "Double"),
                       ItemData(id: "font_size_report", Name: "Font Size - Reports", type: "Double"),
                       
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUpTableView()
    }

    
    func setUpTableView()
    {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "CellDataStreaming", bundle: nil), forCellReuseIdentifier: "CellDataStreaming")
        self.tableView.register(UINib(nibName: "CellSessionValidation", bundle: nil), forCellReuseIdentifier: "CellSessionValidation")
        self.tableView.register(UINib(nibName: "CellNotificationCell", bundle: nil), forCellReuseIdentifier: "CellNotificationCell")
        self.tableView.register(UINib(nibName: "CellSliderForFonts", bundle: nil), forCellReuseIdentifier: "CellSliderForFonts")
        self.tableView.separatorStyle = .none
        self.tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        self.tableView.reloadData()
        
    }
    
    @IBAction func btnCancelPressed(_ sender: Any) {
        
        
    }
    
    @IBAction func btnApplyPressed(_ sender: Any) {
        
        
    }
    
    
    @objc func onAppFontChange(_ sender: UISlider){
        if sender.accessibilityIdentifier == "font_size_app"
        {
            Property.shared.fontSizeApp = Double(sender.value)
            print("App Font == \( Property.shared.fontSizeApp )")
            self.tableView.reloadData()
        }
    
    }

    @objc func onReportsFontChange(_ sender: UISlider){
        if sender.accessibilityIdentifier == "font_size_report"
        {
            Property.shared.fontSizeReport = Double(sender.value)
            print("Report Font == \( Property.shared.fontSizeReport )")
            self.tableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = arrProperty[indexPath.row]
        
        switch item.id{
        case "data_streaming":
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellDataStreaming", for: indexPath) as! CellDataStreaming
            cell.lblTitle.text = item.Name ?? ""
            cell.tfDataStreaming.setDefaultTextFiled(rightIcon: UIImage(named: "downImage"))
            
            return cell
        case "session_validation":
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellSessionValidation", for: indexPath) as! CellSessionValidation
            cell.lblTitle.text = item.Name ?? ""
            cell.tfMinsVal.keyboardType = .numberPad
            return cell
        case "push_notification":
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellNotificationCell", for: indexPath) as! CellNotificationCell
            cell.lblTitle.text = item.Name ?? ""
            return cell
            
        case "dnd_notification":
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellNotificationCell", for: indexPath) as! CellNotificationCell
            cell.lblTitle.text = item.Name ?? ""
            return cell
        case "order_confirmation":
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellNotificationCell", for: indexPath) as! CellNotificationCell
            cell.lblTitle.text = item.Name ?? ""
            return cell
        case "trading_view":
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellNotificationCell", for: indexPath) as! CellNotificationCell
            cell.lblTitle.text = item.Name ?? ""
            return cell
            
        case "font_size_app":
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellSliderForFonts", for: indexPath) as! CellSliderForFonts
            cell.lblTitle.text = item.Name ?? ""
            cell.viewAppFont.isHidden = false
            cell.viewAppReport.isHidden = true
            cell.sliderFont.accessibilityIdentifier = "font_size_app"
            cell.sliderFont.value = Float(Property.shared.fontSizeApp)
            cell.sliderFont.minimumValue = 1
            cell.sliderFont.maximumValue = 2
            cell.sliderFont.addTarget(self, action: #selector(self.onAppFontChange(_:)), for: .valueChanged)
            cell.lblOptions.font = cell.lblOptions.font.withSize(20)
            cell.lblDateFormat.font = cell.lblDateFormat.font.withSize(16)
            cell.lblOptionValue.font = cell.lblOptionValue.font.withSize(20)
            cell.lblOptionValue2.font = cell.lblOptionValue2.font.withSize(16)
            
            cell.lblOptions.font = cell.lblOptions.font.withSize(cell.lblOptions.font.pointSize * Property.shared.fontSizeApp)
            cell.lblDateFormat.font = cell.lblDateFormat.font.withSize(cell.lblDateFormat.font.pointSize * Property.shared.fontSizeApp)
            cell.lblOptionValue.font = cell.lblOptionValue.font.withSize(cell.lblOptionValue.font.pointSize * Property.shared.fontSizeApp)
            cell.lblOptionValue2.font = cell.lblOptionValue2.font.withSize(cell.lblOptionValue2.font.pointSize * Property.shared.fontSizeApp)
            
            return cell
            
        case "font_size_report":
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellSliderForFonts", for: indexPath) as! CellSliderForFonts
            cell.lblTitle.text = item.Name ?? ""
            cell.viewAppFont.isHidden = true
            cell.viewAppReport.isHidden = false
            cell.sliderFont.accessibilityIdentifier = "font_size_report"
            cell.sliderFont.value = Float(Property.shared.fontSizeReport)
            cell.sliderFont.minimumValue = 1
            cell.sliderFont.maximumValue = 2
            cell.sliderFont.addTarget(self, action: #selector(self.onReportsFontChange(_:)), for: .valueChanged)
            
            cell.lblReport1.font = cell.lblReport1.font.withSize(16)
            cell.lblReport2.font = cell.lblReport2.font.withSize(16)
            cell.lblReport3.font = cell.lblReport3.font.withSize(16)
            cell.lblReport4.font = cell.lblReport4.font.withSize(16)
            cell.lblReport5.font = cell.lblReport5.font.withSize(16)
            cell.lblReport6.font = cell.lblReport6.font.withSize(16)
            cell.lblReport7.font = cell.lblReport7.font.withSize(16)
            cell.lblReport8.font = cell.lblReport8.font.withSize(16)
            
            cell.lblReport1.font = cell.lblReport1.font.withSize(cell.lblReport1.font.pointSize * Property.shared.fontSizeReport)
            cell.lblReport2.font = cell.lblReport2.font.withSize(cell.lblReport2.font.pointSize * Property.shared.fontSizeReport)
            cell.lblReport3.font = cell.lblReport3.font.withSize(cell.lblReport3.font.pointSize * Property.shared.fontSizeReport)
            cell.lblReport4.font = cell.lblReport4.font.withSize(cell.lblReport4.font.pointSize * Property.shared.fontSizeReport)
            cell.lblReport5.font = cell.lblReport5.font.withSize(cell.lblReport5.font.pointSize * Property.shared.fontSizeReport)
            cell.lblReport6.font = cell.lblReport6.font.withSize(cell.lblReport6.font.pointSize * Property.shared.fontSizeReport)
            cell.lblReport7.font = cell.lblReport7.font.withSize(cell.lblReport7.font.pointSize * Property.shared.fontSizeReport)
            cell.lblReport8.font = cell.lblReport8.font.withSize(cell.lblReport8.font.pointSize * Property.shared.fontSizeReport)

        
            return cell
       
        case .none:
            return UITableViewCell()
        case .some(_):
            return UITableViewCell()
        }
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrProperty.count
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  UITableView.automaticDimension
    }
    
}

//
//  ProtpertiesSingleton.swift
//  ShareKhanTestProject
//
//  Created by Amey Dalvi on 27/05/24.
//

import Foundation
class Property{
    
    static var shared = Property()
    private init(){
        
    }
    
    var dataStreaming = 1
    var sessionValidtion = 60
    var pushNotification = true
    var dndNotifiaction = false
    var orderConfirmation = false
    var tradingChart = true
    var fontSizeApp = 1.0
    var fontSizeReport = 1.0
    
}

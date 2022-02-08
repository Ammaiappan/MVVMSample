//
//  VIewModel.swift
//  InterviewProject
//
//  Created by Raju on 07/02/22.
//

import Foundation

class ViewModel: NSObject {
    var datas: [String: [String]]
    var allSectionKey: [String] = []
    
    init(serData: [String: [String]]) {
        datas = serData
        allSectionKey = ViewModel.allKeys(datas: datas)
        super.init()
    }
    
    static func allKeys(datas: [String: [String]]) -> [String] {
        if let datas = datas as NSDictionary? {
            if let allKey = datas.allKeys as? [String] {
                return allKey
            }
        }
        return []
    }
}

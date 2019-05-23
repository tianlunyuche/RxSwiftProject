//
//  ZXTask.swift
//  RxSwiftProject
//
//  Created by 赵庄鑫 on 2019/5/23.
//  Copyright © 2019 赵庄鑫. All rights reserved.
//

import UIKit

class ZXTask: ModelType, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var memo: String?
    var isDone: Bool = false
    
    init(title: String, memo: String? = nil) {
        self.title = title
        self.memo = memo
    }
    
    init?(dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
            let title = dictionary["title"] as? String
            else { return nil }
        
        self.id = id
        self.title = title
        self.memo = dictionary["memo"] as? String
        self.isDone = dictionary["isDone"] as? Bool ?? false
    }
}

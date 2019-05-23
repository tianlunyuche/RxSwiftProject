//
//  ModelType.swift
//  RxSwiftProject
//
//  Created by 赵庄鑫 on 2019/5/23.
//  Copyright © 2019 赵庄鑫. All rights reserved.
//

import Then

protocol Identifiable {
    associatedtype Identifier: Equatable
    var id: Identifier { get }
    
}

protocol ModelType: Then {
    
}

extension Collection where Self.Iterator.Element: Identifiable {
    func index(of element: Self.Iterator.Element) -> Self.Index? {
        return self.index { $0.id == element.id }
    }
}

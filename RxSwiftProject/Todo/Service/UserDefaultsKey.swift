//
//  UserDefaultsKey.swift
//  RxSwiftProject
//
//  Created by 赵庄鑫 on 2019/5/23.
//  Copyright © 2019 赵庄鑫. All rights reserved.
//

struct UserDefaultsKey<T> {
    typealias Key<T> = UserDefaultsKey<T>
    let key : String
}

extension UserDefaultsKey: ExpressibleByStringLiteral {
    public init(unicodeScalarLiteral value: StringLiteralType) {
        self.init(key: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        self.init(key: value)
    }
    
    public init(stringLiteral value: StringLiteralType) {
        self.init(key: value)
    }
}

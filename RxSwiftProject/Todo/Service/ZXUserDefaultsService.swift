//
//  ZXUserDefaultsService.swift
//  RxSwiftProject
//
//  Created by 赵庄鑫 on 2019/5/23.
//  Copyright © 2019 赵庄鑫. All rights reserved.
//

import Foundation

extension UserDefaultsKey {
    static var tasks: Key<[[String: Any]]> { return "tasks" }
}

protocol UserDefaultsServiceType {
    func value<T>(forKey key: UserDefaultsKey<T>) -> T?
    func set<T>(value: T?, forKey key: UserDefaultsKey<T>)
}

class ZXUserDefaultsService: UserDefaultsServiceType {
    func value<T>(forKey key: UserDefaultsKey<T>) -> T? {
        
    }
    
    func set<T>(value: T?, forKey key: UserDefaultsKey<T>) {
        
    }
    

}

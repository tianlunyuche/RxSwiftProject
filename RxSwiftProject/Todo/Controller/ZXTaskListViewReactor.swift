//
//  ZXTaskListViewReactor.swift
//  RxSwiftProject
//
//  Created by 赵庄鑫 on 2019/5/23.
//  Copyright © 2019 赵庄鑫. All rights reserved.
//

import ReactorKit
import RxCocoa
import RxDataSources
import RxSwift

typealias TaskListSection = SectionModel<Void, TaskCellReactor>

class ZXTaskListViewReactor: Reactor {
    
    var initialState: State
    
    enum Action {
        case refresh
        case toggleEditing
        case toggleTaskDone(IndexPath)
        case deleteTask(IndexPath)
        case moveTask(IndexPath, IndexPath)
    }
    
    enum Mutation {
        case toggleEditing
        case setSections([TaskListSection])
        case insertSectionItem(IndexPath, TaskListSection.Item)
        case updateSectionItem(IndexPath, TaskListSection.Item)
        case deleteSectionItem(IndexPath)
        case moveSectionItem(IndexPath, IndexPath)
    }
    
    struct State {
        var isEditing: Bool
        var sections: [TaskListSection]
    }
    
    let provider: ServiceProviderType
    
    init(provider: ServiceProviderType) {
        self.provider = provider
        self.initialState = State(
            isEditing: false,
            sections: [TaskListSection(model: Void(), items: [])]
        )
    }
}

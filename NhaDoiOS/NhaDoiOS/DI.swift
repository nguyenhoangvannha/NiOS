//
//  DI.swift
//  NhaDoiOS
//
//  Created by Nguyễn Hoàng Văn Nhã on 4/11/22.
//

import Foundation
import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard
{
    class func setup ()
    {

        
        defaultContainer.register(TodoStore.self) { _ in return TodoStore() }
        
        defaultContainer.register(AbstractTodoDataSource.self) { resolveable in
            return TodoLocalDataSource(todoStore: resolveable.resolve(TodoStore.self)!)
        }
        
        defaultContainer.register(AbstractTodoRepository.self) { resolveable in
            return TodoRepository(todoLocalDataSource: resolveable.resolve(AbstractTodoDataSource.self)!)
        }
        
        defaultContainer.register(TodoViewModel.self) { resolveable in
            return TodoViewModel(todoRepository: resolveable.resolve(AbstractTodoRepository.self)!)
        }

    }
}


@propertyWrapper
struct Inject<Component> {
    let wrappedValue: Component
    init() {
        self.wrappedValue = Resolver.shared.resolve(Component.self)
    }
}

class Resolver {
    static let shared = Resolver()
        private let container = SwinjectStoryboard.defaultContainer

        func resolve<T>(_ type: T.Type) -> T {
            container.resolve(T.self)!
        }
}

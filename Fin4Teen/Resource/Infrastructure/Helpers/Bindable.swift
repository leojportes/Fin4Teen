//
//  Bindable.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import Foundation

public class Bindable<T> {
    
    // MARK: - Typealias
    
    public typealias BindType = ((T) -> Void)
    
    // MARK: - Properties
    
    public var binds: [BindType] = []
    
    /// Dynamic raw value
    public var value: T {
        didSet {
            execBinds()
        }
    }
    
    // MARK: - Initializer
    
    /// - Parameter val: initial dynamic value
    public init(_ val: T) {
        value = val
    }
    
    // MARK: - Public methods
    
    /// Binding value for changes
    /// - Parameter:
    /// - skip: bollean to decide if it should ignore ending callback from init
    /// - bind: callback to notify changed value
    public func bind(skip: Bool = false, _ bind: @escaping BindType) {
        binds.append(bind)
        guard skip else {
            bind(value)
            return
        }
    }
    
    public func remove() {
        _ = binds.popLast()
    }
    
    // MARK: - Private methods
    
    /// Execute bindings
    private func execBinds() {
        binds.forEach { [unowned self] bind in
            bind(self.value)
        }
    }
    
}

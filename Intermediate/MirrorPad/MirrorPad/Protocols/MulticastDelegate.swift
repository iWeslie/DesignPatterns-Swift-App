//
//  MulticastDelegate.swift
//  MirrorPad
//
//  Created by Weslie Chen on 2019/7/25.
//  Copyright © 2019 Razeware, LLC. All rights reserved.
//

public class MulticastDelegate<ProtocolType> {
    
    // MARK: - DelegateWrapper
    private class DelegateWrapper {
        
        weak var delegate: AnyObject?
        
        init(_ delegate: AnyObject) {
            self.delegate = delegate
        }
    }
    
    // MARK: - Instance Properties
    private var delegateWrappers: [DelegateWrapper]
    
    public var delegates: [ProtocolType] {
        delegateWrappers = delegateWrappers
            .filter { $0.delegate != nil }
        return delegateWrappers.map
            { $0.delegate! } as! [ProtocolType]
    }
    
    // MARK: - Object Lifecycle
    public init(delegates: [ProtocolType] = []) {
        delegateWrappers = delegates.map {
            DelegateWrapper($0 as AnyObject)
        }
    }
    
    // MARK: - Delegate Management
    public func addDelegate(_ delegate: ProtocolType) {
        let wrapper = DelegateWrapper(delegate as AnyObject)
        delegateWrappers.append(wrapper)
    }
    
    public func removeDelegate(_ delegate: ProtocolType) {
        guard let index = delegateWrappers.index(where: {
            $0.delegate === (delegate as AnyObject)
        }) else {
            return
        }
        delegateWrappers.remove(at: index)
    }
    
    public func invokeDelegates(_ closure: (ProtocolType) -> ()) {
        delegates.forEach { closure($0) }
    }
}

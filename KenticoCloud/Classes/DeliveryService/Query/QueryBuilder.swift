//
//  QueryBuilder.swift
//  KenticoCloud
//
//  Created by Aliaksandr Kantsevoi on 10/12/18.
//

import Foundation

typealias QueryBuilder = [QueryParameter]

extension Array where Element == QueryParameter {
    private func add(key: QueryParameterKey, value: String) -> [QueryParameter] {
        return self + [QueryParameter(parameterKey: key, parameterValue: value)]
    }
    
    func id(_ value: String) -> [QueryParameter] {
        return add(key: .id, value: value)
    }
    
    func name(_ value: String) -> [QueryParameter] {
        return add(key: .name, value: value)
    }
    
    func codename(_ value: String) -> [QueryParameter] {
        return add(key: .codename, value: value)
    }
    
    func type(_ value: String) -> [QueryParameter] {
        return add(key: .type, value: value)
    }
    
    func sitemapLocations(_ value: String) -> [QueryParameter] {
        return add(key: .sitemapLocations, value: value)
    }
    
    func language(_ value: String) -> [QueryParameter] {
        return add(key: .language, value: value)
    }
    
    static func params() -> [QueryParameter] {
        return []
    }
    
    func queryString() -> String {
        return self.map{$0.getQueryStringParameter()}.joined(separator: "&")
    }
}

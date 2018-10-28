//
//  TaxonomyGroup.swift
//  Pods
//
//  Created by Martin Makarsky on 22/09/2017.
//
//

import ObjectMapper

/// Represents taxonomy group. Taxonomy group is a root of the taxonomy tree.
public class TaxonomyGroup: Mappable {
    
    /// Name of taxonomy group.
    public private(set) var name: String?
    /// Codename of taxonomy group.
    public private(set) var codename: String?
    /// Taxonomy terms
    public private(set) var terms: [TaxonomyTerm]?
    
    /// Maps response's json instance of the taxonomy group into strongly typed object representation.
    public required init?(map: Map){
    }
    
    /// Maps response's json instance of the taxonomy group into strongly typed object representation.
    public func mapping(map: Map) {
        name <- map["system.name"]
        codename <- map["system.codename"]
        terms <- map["terms"]
    }
}

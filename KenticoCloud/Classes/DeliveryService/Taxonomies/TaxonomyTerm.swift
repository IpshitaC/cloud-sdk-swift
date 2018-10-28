//
//  TaxonomyTerm.swift
//  Pods
//
//  Created by Martin Makarsky on 21/09/2017.
//
//

import ObjectMapper

/// Represents taxonomy term. Taxonomy term is a node of the taxonomy tree.
public class TaxonomyTerm: Mappable {
    
    /// Name of taxonomy term.
    public private(set) var name: String?
    // Codename of taxonomy term.
    public private(set) var codename: String?
    // Taxonomy terms.
    public private(set) var terms: [TaxonomyTerm]?
    
    /// Maps response's json instance of the taxonomy term into strongly typed object representation.
    public required init?(map: Map){
    }
    
    /// Maps response's json instance of the taxonomy term into strongly typed object representation.
    public func mapping(map: Map) {
        name <- map["name"]
        codename <- map["codename"]
        terms <- map["terms"]
    }
}

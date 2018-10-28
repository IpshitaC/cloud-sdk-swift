//
//  Block.swift
//  Pods
//
//  Created by Martin Makarsky on 05/09/2017.
//
//

import Kanna

/// Protocol for RichText's blocks.
public protocol Block {
}

extension Block {
    
    func isKenticoCloudApplicationType(tag: String) -> Bool {
        let typeXpath = "//@type"
        if let tagDoc = try? HTML(html: tag, encoding: .utf8) {
            let type = tagDoc.xpath(typeXpath).first?.content
            
            if type == "application/kenticocloud" {
                return true
            }
        }
        
        return false
    }
}




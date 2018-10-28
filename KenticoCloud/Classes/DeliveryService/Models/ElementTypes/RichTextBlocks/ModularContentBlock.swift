//
//  ModularContentBlock.swift
//  Pods
//
//  Created by Martin Makarsky on 05/09/2017.
//
//

import Kanna

/// Represents ModularContentBlock in RichText element.
public class ModularContentBlock: Block {
    
    /// Name of the modular content item.
    public private(set) var contentItemName: String?
    
    init?(html: String?) {
        if let objectTag = html {
            if (isModularContent(objectTag: objectTag)) {
                if let contentItemName = getModularContentName(objectTag: html) {
                    self.contentItemName = contentItemName
                }
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    private func isModularContent(objectTag: String) -> Bool {
        let dataTypeXpath = "//@data-type"
        if let figureTagDoc = try? HTML(html: objectTag, encoding: .utf8) {
            let dataType = figureTagDoc.xpath(dataTypeXpath).first?.content
            
            if isKenticoCloudApplicationType(tag: objectTag) && dataType == "item" {
                return true
            }
        }
        
        return false
    }
    
    private func getModularContentName(objectTag: String?) -> String? {
        if let objectTag = objectTag {
            let codeNameXpath = "//@data-codename"
            if let objTagDoc = try?  HTML(html: objectTag, encoding: .utf8) {
                let name = objTagDoc.xpath(codeNameXpath).first?.content
                return name
            }
        }
        
        return nil
    }
}

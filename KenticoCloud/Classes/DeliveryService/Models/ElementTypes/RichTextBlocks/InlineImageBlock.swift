//
//  InlineImageBlock.swift
//  Pods
//
//  Created by Martin Makarsky on 06/09/2017.
//
//

import Kanna

/// Represents InlineImageBlock in RichText element.
public class InlineImageBlock: Block {
    
    /// Description of the inline image.
    public private(set) var description: String?
    /// Url of the inline image.
    public private(set) var url: String?
    
    init?(html: String?) {
        if let tag = html {
            if (isInlineImageBlock(figureTag: tag)) {
                if let description = getDescription(figureTag: tag) {
                    self.description = description
                }
                if let url = getUrl(figureTag: tag) {
                    self.url = url
                }
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    private func isInlineImageBlock(figureTag: String?) -> Bool {
        if let figureTag = figureTag {
            let assetXpath = "//figure/@data-asset-id"
            if let figureTagDoc = try? HTML(html: figureTag, encoding: .utf8) {
                let assetId = figureTagDoc.xpath(assetXpath).first?.content
                
                if assetId != nil {
                    return true
                }
            }
        }
        
        return false
    }
    
    private func getUrl(figureTag: String?) -> String? {
        if let figureTag = figureTag {
            let srcXpath = "//figure/img/@src"
            if let figureTagDoc = try? HTML(html: figureTag, encoding: .utf8) {
                return figureTagDoc.xpath(srcXpath).first?.content
            }
        }
        
        return nil
    }
    
    private func getDescription(figureTag: String?) -> String? {
        if let figureTag = figureTag {
            let descriptionXpath = "//figure/img/@alt"
            if let figureTagDoc = try? HTML(html: figureTag, encoding: .utf8) {
                return figureTagDoc.xpath(descriptionXpath).first?.content
            }
        }

        return nil
    }
}

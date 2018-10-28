//
//  RichTextElement.swift
//  Pods
//
//  Created by Martin Makarsky on 04/09/2017.
//
//

import Kanna
import ObjectMapper

/// Represents RichText element.
public class RichTextElement: Mappable {
    
    private var elementName: String = ""
    private var supportedBlocksXpath = "//p | //h1 | //h2 | //h3 | //h4 | //strong | //em | //ol | //ul | //a | //object[@type='application/kenticocloud'][@data-type='item'] | //figure"

    public private(set) var type: String?
    public private(set) var name: String?
    public private(set) var value: String?
    public private(set) var blocks: [Block?] = []
    public private(set) var inlineImages: [InlineImageBlock?] = []
    public private(set) var htmlContent: [HtmlContentBlock?] = []
    public private(set) var modularContent: [ModularContentBlock?] = []
    public private(set) var htmlContentString: String = ""
    
    /// Maps response's json instance of the element into strongly typed object representation.
    public required init?(map: Map){
        if let context = map.context as? ElementContext {
            elementName = context.elementName
        }
        
        let value = map["elements.\(elementName).value"].currentValue as? String
        
        if let value = value {
            if let doc = try? HTML(html: value, encoding: .utf8) {
                let supportedBlocks = doc.xpath(supportedBlocksXpath)
                    for block in supportedBlocks {
                        if let tag = block.tagName {
                            switch tag {
                            case "p", "h1", "h2", "h3", "h4", "ol", "ul", "strong", "em", "a":
                                if let htmlContentblock = HtmlContentBlock.init(html: block.toHTML) {
                                    self.blocks.append(htmlContentblock)
                                    htmlContent.append(htmlContentblock)
                                }
                                
                                if let contentString = block.toHTML {
                                    htmlContentString.append(contentString)
                                }
                            case "object":
                                if let block = ModularContentBlock.init(html: block.toHTML) {
                                    self.blocks.append(block)
                                    modularContent.append(block)
                                }
                            case "figure":
                                if let block = InlineImageBlock.init(html: block.toHTML) {
                                    self.blocks.append(block)
                                    inlineImages.append(block)
                                }
                            default:
                                print("Unknown block")
                            }
                        }
                }
            }
        }
    }
    
    /// Maps response's json instance of the element into strongly typed object representation.
    public func mapping(map: Map) {
        type <- map["elements.\(elementName).type"]
        name <- map["elements.\(elementName).name"]
        value <- map["elements.\(elementName).value"]
    }
}


//
//  RichtextElement.swift
//  KenticoCloud
//
//  Created by Martin Makarsky on 10/11/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import KenticoCloud

class RichtextElementSpec: QuickSpec {
    override func spec() {
        describe("Get richtext element") {
            
            let client = DeliveryClient.init(projectId: TestConstants.projectId)
            
            //MARK: Properties tests
            
            context("checking properties", {
                
                it("all properties are correct") {
                    
                    waitUntil(timeout: 5) { done in
                        client.getItem(modelType: ArticleTestModel.self, itemName: "on_roasts", completionHandler:
                            { (isSuccess, deliveryItem, error) in
                                if !isSuccess {
                                    fail("Response is not successful. Error: \(String(describing: error))")
                                }
                                
                                if let bodyCopy = deliveryItem?.item?.bodyCopy {
                                    let expectedType = "rich_text"
                                    let expectedName = "Body Copy"
                                    let expectedValueLength = 3318
                                    let expectedBlocksCount = 14
                                    let expectedInlineImagesBlocksCount = 2
                                    let expectedHtmlContentBlocksCount = 10
                                    let expectedModularContentBLocksCount = 2
                                    expect(bodyCopy.type) == expectedType
                                    expect(bodyCopy.name) == expectedName
                                    expect(bodyCopy.value?.count) == expectedValueLength
                                    expect(bodyCopy.blocks.count) == expectedBlocksCount
                                    expect(bodyCopy.inlineImages.count) == expectedInlineImagesBlocksCount
                                    expect(bodyCopy.htmlContent.count) == expectedHtmlContentBlocksCount
                                    expect(bodyCopy.modularContent.count) == expectedModularContentBLocksCount
                                    done()
                                }
                        })
                    }
                }
            })
        }
    }
}

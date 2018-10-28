//
//  InlineImageBlockTests.swift
//  KenticoCloud
//
//  Created by Martin Makarsky on 11/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import KenticoCloud

class InlineImageBlockSpec: QuickSpec {
    override func spec() {
        describe("Get inline image block") {
            
            let client = DeliveryClient.init(projectId: TestConstants.projectId)
            
            //MARK: Descriptions tests
            
            context("checking description", {
                
                it("returns proper description") {
                    
                    waitUntil(timeout: 5) { done in
                        client.getItem(modelType: ArticleTestModel.self, itemName: "on_roasts", completionHandler:
                            { (isSuccess, deliveryItem, error) in
                                if !isSuccess {
                                    fail("Response is not successful. Error: \(String(describing: error))")
                                }
                                
                                if let imageBlock = deliveryItem?.item?.bodyCopy?.inlineImages.first {
                                    let expectedDescription = "A nice cup of coffee brewed with a Chemex"
                                    expect(imageBlock?.description) == expectedDescription
                                    done()
                                }
                        })
                    }
                }
            })
            
            //MARK: URL tests
            
            context("checking url", {
                
                it("returns proper url") {
                    
                    waitUntil(timeout: 5) { done in
                        client.getItem(modelType: ArticleTestModel.self, itemName: "on_roasts", completionHandler:
                            { (isSuccess, deliveryItem, error) in
                                if !isSuccess {
                                    fail("Response is not successful. Error: \(String(describing: error))")
                                }
                                
                                if let imageBlock = deliveryItem?.item?.bodyCopy?.inlineImages.first {
                                    let expectedUrl = "https://assets-us-01.kc-usercontent.com:443/b48c8305-a4f7-4889-a79f-49920e673a1e/83d110b2-3bff-4b4e-9070-f6b30e7802ea/coffee-cup-mug-cafe-small.jpg"
                                    expect(imageBlock?.url) == expectedUrl
                                    done()
                                }
                        })
                    }
                }
            })
            
        }
    }
}



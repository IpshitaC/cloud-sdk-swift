//
//  GetItemSecured.swift
//  KenticoCloud_Tests
//
//  Created by Martin Makarsky on 18/10/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import KenticoCloud

class GetItemSecuredSpec: QuickSpec {
    override func spec() {
        describe("Get single item request from secured project") {
            
            let client = DeliveryClient.init(projectId: TestConstants.securedProjectId, secureApiKey: TestConstants.secureApiKey)
            
            //MARK: Custom Model mapping
            
            context("using item name and custom model mapping", {
                
                it("returns proper item") {
                    
                    waitUntil(timeout: 5) { done in
                        client.getItem(modelType: CafeTestModel.self, itemName: "new_york", completionHandler:
                            { (isSuccess, deliveryItem, error) in
                                if !isSuccess {
                                    fail("Response is not successful. Error: \(String(describing: error))")
                                }
                                
                                if let country = deliveryItem?.item?.country {
                                    let expectedCountry = "USA"
                                    expect(country) == expectedCountry
                                    done()
                                }
                        })
                    }
                }
            })
            
            
            context("using custom query and custom model mapping", {
                
                it("returns proper item") {
                    
                    let customQuery = "items/new_york?elements=country"
                    
                    waitUntil(timeout: 5) { done in
                        client.getItem(modelType: CafeTestModel.self, customQuery: customQuery, completionHandler: { (isSuccess, deliveryItem, error) in
                            if !isSuccess {
                                fail("Response is not successful. Error: \(String(describing: error))")
                            }
                            
                            if let country = deliveryItem?.item?.country {
                                let expectedCountry = "USA"
                                expect(country) == expectedCountry
                                done()
                            }
                        })
                    }
                }
            })
            
            //MARK: Auto mapping using Delivery element types
            context("using item name and Delivery element types", {
                
                it("returns proper item") {
                    
                    waitUntil(timeout: 5) { done in
                        client.getItem(modelType: ArticleTestModel.self, itemName: "which_brewing_fits_you_", completionHandler: { (isSuccess, deliveryItem, error) in
                            if !isSuccess {
                                fail("Response is not successful. Error: \(String(describing: error))")
                            }
                            
                            if let title = deliveryItem?.item?.title?.value {
                                let expectedTitle = "Which brewing fits you?"
                                expect(title) == expectedTitle
                                done()
                            }
                        })
                    }
                }
            })
            
            context("using custom query and Delivery element types", {
                
                it("returns array of items") {
                    
                    let customQuery = "items/which_brewing_fits_you_?elements=title"
                    
                    waitUntil(timeout: 5) { done in
                        client.getItem(modelType: ArticleTestModel.self, customQuery: customQuery, completionHandler: { (isSuccess, deliveryItem, error) in
                            if !isSuccess {
                                fail("Response is not successful. Error: \(String(describing: error))")
                            }
                            
                            if let title = deliveryItem?.item?.title?.value {
                                let expectedTitle = "Which brewing fits you?"
                                expect(title) == expectedTitle
                                done()
                            }
                        })
                    }
                }
            })
            
        }
    }
}


//
//  AssetElement.swift
//  KenticoCloud
//
//  Created by Martin Makarsky on 11/10/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import KenticoCloud

class AssetElementSpec: QuickSpec {
    override func spec() {
        describe("Get asset element") {
            
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
                                
                                if let teaserImage = deliveryItem?.item?.asset {
                                    let expectedType = "asset"
                                    let expectedName = "Teaser image"
                                    let expectedAssetName = "on-roasts-1080px.jpg"
                                    let expectedAssetType = "image/jpeg"
                                    let expectedAssetSize = 121946
                                    let expecdtedAssetDescription = "Coffee Roastery"
                                    let expectedAssetUrl = "https://assets-us-01.kc-usercontent.com:443/b48c8305-a4f7-4889-a79f-49920e673a1e/f6daed1f-3f3b-4036-a9c7-9519359b9601/on-roasts-1080px.jpg"
                                    
                                    let asset = teaserImage.value![0]
                                    
                                    expect(teaserImage.type) == expectedType
                                    expect(teaserImage.name) == expectedName
                                    expect(asset.name) == expectedAssetName
                                    expect(asset.type) == expectedAssetType
                                    expect(asset.size) == expectedAssetSize
                                    expect(asset.description) == expecdtedAssetDescription
                                    expect(asset.url) == expectedAssetUrl

                                    done()
                                }
                        })
                    }
                }
            })
        }
    }
}


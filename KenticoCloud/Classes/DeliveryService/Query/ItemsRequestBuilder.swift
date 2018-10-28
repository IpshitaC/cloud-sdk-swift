//
//  ItemsRequestBuilder.swift
//  Pods
//
//  Created by Martin Makarsky on 11/09/2017.
//
//

class ItemsRequestBuilder {
    
    private var endpointUrl: String
    private var projectId: String
    private var queryParameters: [QueryParameter]
    
    
    init(endpointUrl: String, projectId: String, queryParameters: [QueryParameter]) {
        self.endpointUrl = endpointUrl
        self.projectId = projectId
        self.queryParameters = queryParameters
    }
    
    func getRequestUrl() -> String {
        return "\(endpointUrl)/\(projectId)/items?\(queryParameters.queryString())"
    }
}

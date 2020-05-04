//
//  ServiceInteractionHandler.swift
//  API Master
//
//  Created by TPFLAP146 on 04/05/20.
//  Copyright © 2020 vijay. All rights reserved.
//

import Foundation
import UIKit

//MARK: Service Interaction - Post with data
class ServiceInteraction {
    
    static func postAPICallwithParametersData(urlStringValue:String,callingVC:UIViewController,foregroundAPICall:Bool,parameters:Dictionary<String, String>, completionBlock: @escaping (Data) -> Void) -> Void
    {
        
        
        let urlString = URL(string: urlStringValue)
        var request = URLRequest(url: urlString!)
        
        if foregroundAPICall {
            if !Reachability.isInternetAvailable(vc: callingVC) {
                return
            }
            Loader.show(vc: callingVC)
        } else {
            if !Reachability.isInternetAvailable() {
                return
            }
        }
        
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //request.setValue(Constants.URLS.HEADER_VALUE, forHTTPHeaderField: Constants.URLS.HEADER_KEY)
        
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = Constants.ApplicationGenerics.APIs.MINIMUM_TIMEOUT
        session.configuration.timeoutIntervalForResource = Constants.ApplicationGenerics.APIs.MINIMUM_TIMEOUT

        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            Loader.hide(vc: callingVC)
            guard let data = data else {
                return
            }
            
            completionBlock(data)
            
        })
        
        task.resume()
        
    }
}

//Usage - Post Call


//MARK: - Servie Interaction - Put with Data
extension ServiceInteraction {
    
    static func putAPICallwithParametersData(urlStringValue:String,callingVC:UIViewController,foregroundAPICall:Bool,parameters:Dictionary<String, String>, completionBlock: @escaping (Data) -> Void) -> Void
    {
        
        
        let urlString = URL(string: urlStringValue)
        var request = URLRequest(url: urlString!)
        
        if foregroundAPICall {
            if !Reachability.isInternetAvailable(vc: callingVC) {
                return
            }
            Loader.show(vc: callingVC)
        } else {
            if !Reachability.isInternetAvailable() {
                return
            }
        }
        
        request.httpMethod = "PUT"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //request.setValue(Constants.URLS.HEADER_VALUE, forHTTPHeaderField: Constants.URLS.HEADER_KEY)
        
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = Constants.ApplicationGenerics.APIs.MINIMUM_TIMEOUT
        session.configuration.timeoutIntervalForResource = Constants.ApplicationGenerics.APIs.MINIMUM_TIMEOUT

        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            Loader.hide(vc: callingVC)
            guard let data = data else {
                return
            }
            
            completionBlock(data)
            
        })
        
        task.resume()
        
    }
}


//MARK: - Service Interaction - Get with Data
extension ServiceInteraction {
    
    static func getAPICallwithDataResponse(urlStringValue:String,callingVC:UIViewController,foregroundAPICall:Bool,completionBlock: @escaping (Data) -> Void) -> Void
    {
        
        let urlString = URL(string: urlStringValue)
        
        if foregroundAPICall {
            if !Reachability.isInternetAvailable(vc: callingVC) {
                return
            }
            Loader.show(vc: callingVC)
        } else {
            if !Reachability.isInternetAvailable() {
                return
            }
        }
        
        var request = URLRequest(url: urlString!)
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        //request.setValue(Constants.URLS.HEADER_VALUE, forHTTPHeaderField: Constants.URLS.HEADER_KEY)
        
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = Constants.ApplicationGenerics.APIs.MINIMUM_TIMEOUT
        session.configuration.timeoutIntervalForResource = Constants.ApplicationGenerics.APIs.MINIMUM_TIMEOUT
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            Loader.hide(vc: callingVC)
            guard let data = data else {
                return
            }
            completionBlock(data)
        })
        task.resume()
    }
    
}


//MARK: - Servie Interaction - Delete with Data
extension ServiceInteraction {
    
    static func deleteAPICallwithParametersData(urlStringValue:String,callingVC:UIViewController,foregroundAPICall:Bool,parameters:Dictionary<String, String>, completionBlock: @escaping (Data) -> Void) -> Void
    {
        
        
        let urlString = URL(string: urlStringValue)
        var request = URLRequest(url: urlString!)
        
        if foregroundAPICall {
            if !Reachability.isInternetAvailable(vc: callingVC) {
                return
            }
            Loader.show(vc: callingVC)
        } else {
            if !Reachability.isInternetAvailable() {
                return
            }
        }
        
        request.httpMethod = "DELETE"
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        //request.setValue(Constants.URLS.HEADER_VALUE, forHTTPHeaderField: Constants.URLS.HEADER_KEY)
        
        let session = URLSession.shared
        session.configuration.timeoutIntervalForRequest = Constants.ApplicationGenerics.APIs.MINIMUM_TIMEOUT
        session.configuration.timeoutIntervalForResource = Constants.ApplicationGenerics.APIs.MINIMUM_TIMEOUT

        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            
            Loader.hide(vc: callingVC)
            guard let data = data else {
                return
            }
            
            completionBlock(data)
            
        })
        
        task.resume()
        
    }
}


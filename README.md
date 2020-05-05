# API-Master

## Introduction:

This project is created to understand the working of API-Master and also to have a ready made component for integration in the projects. 

You can find the handler component for GET, POST, PUT and DELETE API Calls respectively and examples for implementation is also given in the View Controller.

---------------------------------------------------------------------------------------------------

## Installation:


There is no specific installation needed for this implementation.


----------------------------------------------------------------------------------------------------

## Configuration:

There is no specific configuration needed for this implementation.

----------------------------------------------------------------------------------------------------

## Coding Part - Handler:

The Handler comes with a Network Handler and an Activity Indicator. It is packaged together to form the API layer.

### Generic Handler

```
    //MARK: - Service Interaction - Generic
    extension ServiceInteraction {
        
        static func apiCall(urlString:String,callingVC:UIViewController,httpMethod:APIMethod,foregroundAPICall:Bool,parameters:Dictionary<String, String>?,completionBlock: @escaping (Data) -> Void) -> Void
        {
            
            //Internet Check and showing Activity Indicator
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
            
            let urlString = URL(string: urlString)
            var request = URLRequest(url: urlString!)
            request.httpMethod = httpMethod.description
            
            //Passing Parameter
            if httpMethod != .GET {
                if let param = parameters {
                    request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
                } else {
                    Toast.showasync(message: "Pass Body Parameter", controller: callingVC)
                }
            }
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            //request.setValue(Constants.URLS.HEADER_VALUE, forHTTPHeaderField: Constants.URLS.HEADER_KEY)
            
            //API Time Out
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
```

### HTTP Method

```
    //MARK: - HTTP Method
    enum APIMethod {
        
        case GET
        case POST
        case PUT
        case DELETE
        
        var description : String {
         
            switch self {
          
          case .GET: return "GET"
          case .POST: return "POST"
          case .PUT: return "PUT"
          case .DELETE: return "DELETE"
          }
            
        }
        
    }


```

---------------------------------------------------------------------------------------------------

## Helper Part

### Toast is used for assisting the main functionality. Activity Indicator and Network Reachability are used for assisting API handler.

----------------------------------------------------------------------------------------------------

## Usage Part

### You can see the Invoking part in each of the example given in the View Controller. 




### Check out my Post about API-Master : [API Layer](https://vijaysn.com/mobile/ios/ios-api-layer)

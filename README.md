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

The Handler comes with a Network Handler and an Activity Indicator. It is packaged together to form the network layer.

### GET

```
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
```

### POST

```
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
```

### PUT

```
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
```

### DELETE

```
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


```




---------------------------------------------------------------------------------------------------

## Helper Part

### Toast is used for assisting the main functionality. Activity Indicator and Network Reachability are used for assisting API handler.

----------------------------------------------------------------------------------------------------

## Usage Part

### You can see the Invoking part in each of the example given in the View Controller. 


### Check out my Post about API-Master : [API-Master](https://vijaysn.com/2020/04/23/ios-av-player/)

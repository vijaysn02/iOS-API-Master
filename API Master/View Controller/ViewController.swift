//
//  ViewController.swift
//  API Master
//
//  Created by TPFLAP146 on 03/05/20.
//  Copyright © 2020 vijay. All rights reserved.
//

import UIKit

//MARK: - View Controller - Initialization
class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}

//MARK: - Button Actions
extension ViewController {
    
    @IBAction func getAPIButtonClicked(_ sender: Any) {
        getAPICall()
    }
    @IBAction func postAPIButtonClicked(_ sender: Any) {
        triggerPostAPICall()
    }
    @IBAction func putAPIButtonClicked(_ sender: Any) {
        triggerPutAPICall()
    }
    @IBAction func deleteAPIButtonClicked(_ sender: Any) {
        triggerDeleteAPICall()
    }
    
}


//MARK: - Get API CAll
extension ViewController  {

    func getAPICall() {
        
        let urlString = Constants.URLs.API_URL
        let urlwithParameters = urlString + "?page=2"
        
        ServiceInteraction.apiCall(urlString: urlwithParameters, callingVC: self, httpMethod: .GET, foregroundAPICall: true, parameters: nil) { (responseData) in
            
            do {
                let response = try JSONDecoder().decode(GetResponse.self, from: responseData)
                DispatchQueue.main.async {
                    self.processGetResponse(response:response)
                }
            } catch let jsonResponseError {
                print(jsonResponseError.localizedDescription)
                Toast.showasync(message: "Something went wrong", controller: self)
            }
            
        }
        
    }
    func processGetResponse(response:GetResponse) {
        Toast.showasync(message: "Succesful - Get Call", controller: self)
        //Process your JSON response
    }

}

//MARK: - Post API Call
extension ViewController {

    func triggerPostAPICall() {
        let name = "Rajesh"
        let job = "Model"
        postAPICall(name: name, job: job)
    }
    func postAPICall(name:String,job:String) {
        
        let urlString = Constants.URLs.API_URL
        let request = PostRequest(name: name, job: job)
        let parametersList = request.dictionary

        ServiceInteraction.apiCall(urlString: urlString, callingVC: self, httpMethod: .POST, foregroundAPICall: true, parameters: parametersList) { (responseData) in
             do {
                let response = try JSONDecoder().decode(PostResponse.self, from: responseData)
                DispatchQueue.main.async {
                   self.processPostResponse(response:response)
                }
             } catch let jsonResponseError {
                print(jsonResponseError.localizedDescription)
                Toast.showasync(message: "Something went wrong", controller: self)
             }
        }
        
    }
    func processPostResponse(response:PostResponse) {
        Toast.showasync(message: "Succesful - Post Call", controller: self)
        //Process your JSON response
    }

}


//MARK: - Put API Call
extension ViewController {

    func triggerPutAPICall() {
        let name = "Rajesh"
        let job = "Model"
        putAPICall(name: name, job: job)
    }
    func putAPICall(name:String,job:String) {
        
        let urlString = Constants.URLs.API_URL
        let request = PutRequest(name: name, job: job)
        let parametersList = request.dictionary

        ServiceInteraction.apiCall(urlString: urlString, callingVC: self, httpMethod: .PUT, foregroundAPICall: true, parameters: parametersList) { (responseData) in
            
            do {
                let response = try JSONDecoder().decode(PutResponse.self, from: responseData)
                DispatchQueue.main.async {
                    self.processPutResponse(response:response)
                }
            } catch let jsonResponseError {
                print(jsonResponseError.localizedDescription)
                Toast.showasync(message: "Something went wrong", controller: self)
            }
            
        }
        
    }
    func processPutResponse(response:PutResponse) {
        Toast.showasync(message: "Succesful - Put Call", controller: self)
        //Process your JSON response
    }

}

//MARK: - Delete API Call
extension ViewController {

    func triggerDeleteAPICall() {
        let name = "Rajesh"
        let job = "Model"
        deleteAPICall(name: name, job: job)
    }
    func deleteAPICall(name:String,job:String) {
        
        let urlString = Constants.URLs.API_URL
        let request = DeleteRequest(name: name, job: job)
        let parametersList = request.dictionary

        ServiceInteraction.apiCall(urlString: urlString, callingVC: self, httpMethod: .DELETE, foregroundAPICall: true, parameters: parametersList) { (responseData) in
            
            Toast.showasync(message: "Succesful - Delete Call", controller: self)
            
        }
        
    }
}



//
//  ViewController.swift
//  EzDealzDemo
//
//  Created by MuhammadKhan on 4/25/18.
//  Copyright © 2018 MuhammadKhan. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let loginURL = "http://www.ezdealz.com/main/doLogin"
    let signupURL = "http://www.ezdealz.com/main/doSignup"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        login()
        signup()
    }

    private func login() {
        
        let params: Parameters = [ "email" : "mk@gmail.com",
                                   "password" : "123456",
                                   "app_type" : "ios",
                                   "app_token" : "1234567890" ]
        
        Alamofire.request(loginURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).response { (response) in
            if let error = response.error {
                print("Network Error: ", error)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: AnyObject]
                    print(json)
                } catch {
                    print("Catch Error: ", error)
                }
            }
        }
    }
    
    private func signup() {
        
        let params: Parameters = [ "fname" : "MK",
                                   "email" : "mk@gmail.com",
                                   "password" : "123456",
                                   "phone" : "03338222120",
                                   "address" : "Gulistan e Johar",
                                   "city" : "Karachi",
                                   "dob" : "1234",
                                   "gender" : "male",
                                   "app_token" : "1234567890",
                                   "app_type" : "ios" ]
        
        Alamofire.request(signupURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).response { (response) in
            if let error = response.error {
                print("Network Error: ", error)
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: response.data!, options: .allowFragments) as! [String: AnyObject]
                    print(json)
                } catch {
                    print("Catch Error: ", error)
                }
            }
        }
    }
    
}


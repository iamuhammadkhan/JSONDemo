//
//  ViewController.swift
//  EzDealzDemo
//
//  Created by MuhammadKhan on 4/25/18.
//  Copyright © 2018 MuhammadKhan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    let signupURL = "http://www.ezdealz.com/main/doSignup"
    let countryURL = "http://www.ezdealz.com/main/country_list"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        country()
        signup()
    }
    
    private func country() {
        
        let params = [ "language_id" : "1" ]
        
        Alamofire.request(countryURL, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            print("Initial Response: ", response)
            
            if let error = response.error {
                print("Network Error: \(error)")
            } else {
                do {
                    let json = try JSON(data: response.data!)
                    print("Response: ", json)
                } catch {
                    print("Catch Error: ", error)
                }
            }
        }
    }
    
    private func signup() {
        
        let params = [ "fname" : "MK",
                       "email" : "mytest@gmail.com",
                       "password" : "123456",
                       "phone" : "03338222120",
                       "address" : "Gulistan e Johar",
                       "city" : "1",
                       "dob" : "1234",
                       "gender" : "male",
                       "app_token" : "1234567890",
                       "app_type" : "ios" ]
        
        Alamofire.request(signupURL, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            print("Initial Response: ", response)
            print("Initial Response Result: ", response.result)
            print("Initial Response Result Value: ", response.result.value!)
            
            if let error = response.error {
                print("Network Error: \(error)")
            } else {
                do {
                    let json = try JSON(data: response.data!)
                    print("Response: ", json)
                } catch {
                    print("Catch Error: ", error)
                }
            }
        }
    }
}


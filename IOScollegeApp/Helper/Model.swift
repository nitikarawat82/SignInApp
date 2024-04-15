//
//  Constants.swift
//  IOScollegeApp
//
//  Created by HT-Mac-06 on 4/10/24.
//

import Foundation


class User
{
    
    var email: String = ""
    var phone: String = ""
    var id: Int = 0
    
    init(id:Int, email:String, phone:String)
    {
        self.id = id
        self.email = email
        self.phone = phone
    }
    
}

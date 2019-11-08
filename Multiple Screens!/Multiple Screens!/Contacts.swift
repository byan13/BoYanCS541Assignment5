//
//  Contacts.swift
//  Multiple Screens!
//
//  Created by Bo Yan on 11/3/19.
//  Copyright © 2019 Bo Yan. All rights reserved.
//

import UIKit

class Contacts {
    var name: String
    var phoneNumber: String
    var photo: UIImage?
    
    init?(name: String, phoneNumber: String, photo: UIImage?) {
        if(name.isEmpty || phoneNumber.isEmpty){
            return nil
        }
        self.name = name
        self.phoneNumber = phoneNumber
        self.photo = photo
    }
}

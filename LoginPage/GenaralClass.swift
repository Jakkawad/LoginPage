//
//  GenaralClass.swift
//  LoginPage
//
//  Created by admin on 3/29/2560 BE.
//  Copyright © 2560 Jakkawad.Chaiplee. All rights reserved.
//

import UIKit
import Alamofire


func checkUser(id: String) {
    print("id: \(id)")
}

// MD5 Encoder
func MD5(string: String) -> Data {
    let messageData = string.data(using: .utf8)!
    var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
    
    _ = digestData.withUnsafeMutableBytes {digestBytes in
        messageData.withUnsafeBytes {messageBytes in
            CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
        }
    }
    
    return digestData
}

//func md5(_ string: String) -> String {
//    
//    let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
//    var digest = Array<UInt8>(repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
//    CC_MD5_Init(context)
//    CC_MD5_Update(context, string, CC_LONG(string.lengthOfBytes(using: String.Encoding.utf8)))
//    CC_MD5_Final(&digest, context)
//    context.deallocate(capacity: 1)
//    var hexString = ""
//    for byte in digest {
//        hexString += String(format:"%02x", byte)
//    }
//    
//    return hexString
//}

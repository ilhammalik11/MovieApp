//
//  Connectivity.swift
//  MovieApp
//
//  Created by ILHAM on 12/03/20.
//  Copyright © 2020 ILHAM. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

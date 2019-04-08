//
//  StackExchangeAPI.swift
//  StackOverflowApp
//
//  Created by John Meeker on 4/7/19.
//  Copyright © 2019 John Meeker. All rights reserved.
//

import Siesta

struct Constants {
    static let stackExchangeBaseUrl: String = "https://api.stackexchange.com/2.2"
}

@objc public class StackExchangeAPI: Service {
    @objc public static let instance = StackExchangeAPI(baseURL: Constants.stackExchangeBaseUrl)
}

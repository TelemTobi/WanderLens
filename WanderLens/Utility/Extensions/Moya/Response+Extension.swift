//
//  Response+Extension.swift
//  WanderLens
//
//  Created by Telem Tobi on 18/09/2023.
//

import Moya

extension Response {
    
    func printSuccessfulResponse() {
        #if DEBUG
        print()
        print("📊📊📊📊📊📊📊📊📊📊📊📊📊📊")
        print("ℹ️ Success from:\n\(request?.url?.absoluteString ?? "Unknown URL 🥴")")
        print("ℹ️ Http Method: \(request?.httpMethod ?? "Unknown Method")")
        print("ℹ️ Status Code: \(statusCode)")
        if let headers = request?.headers.dictionary, !headers.isEmpty { print("ℹ️ Headers:\n\(headers)") }
        if let body = request?.httpBody?.prettyPrintedJSON { print("ℹ️ Body:\n\(body)") }
        if let resonse = data.prettyPrintedJSON { print("ℹ️ Response:\n\(resonse)") }
        print("📊📊📊📊📊📊📊📊📊📊📊📊📊📊")
        print()
        #endif
    }
    
    func printErrorResponse(with error: Error? = nil) {
        #if DEBUG
        print()
        print("🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨")
        print("ℹ️ Error from:\n\(request?.url?.absoluteString ?? "Unknown URL 🥴")")
        print("ℹ️ Http Method: \(request?.httpMethod ?? "Unknown Method")")
        print("ℹ️ Status Code: \(statusCode)")
        print("ℹ️ Headers:\n\(request?.headers.dictionary ?? [:])")
        print("ℹ️ Body:\n\(request?.httpBody?.prettyPrintedJSON ?? "Unable to pretty print body")")
        print("ℹ️ Error:\n\(error.debugDescription)")
        print("🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨")
        print()
        #endif
    }
}


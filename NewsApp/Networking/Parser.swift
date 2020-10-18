//
//  Parser.swift
//  NewsApp
//
//  Created by Kabdolla on 10/14/20.
//  Copyright © 2020 Kabdolla. All rights reserved.
//

import Alamofire

protocol Parser {
    func parse<T: Decodable>(response: AFDataResponse<Any>) -> Result<T>
}

enum Result<T>: Error {
    case success(T)
    case failure(String)
}

class DecodeParser: Parser {
    private func serializeStatusCode(_ statusCode: Int) -> String {
        var error: Error
        switch statusCode {
        case 100..<200:
            error = CustomError.informationalError
        case 300..<400:
            error = CustomError.redirectionError
        case 400..<500:
            error = CustomError.notFoundError
        case 500..<600:
            error = CustomError.serverError
        default:
            error = CustomError.unknownError
        }
        
        return error.localizedDescription
    }
    
    func parse<T: Decodable>(response: AFDataResponse<Any>) -> Result<T> {
        switch response.result {
        case .failure(let error):
            if let statusCode = response.response?.statusCode {
                let message = serializeStatusCode(statusCode)
                return Result.failure(message)
            } else {
                switch error._code {
                case NSURLErrorTimedOut:
                    return Result.failure("Timeout expired")
                case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost:
                    return Result.failure("Connect to the network")
                default:
                    return Result.failure(error.localizedDescription)
                }
            }
        case .success:
            if let result = response.value {
                if JSONSerialization.isValidJSONObject(result) {
                    
                    let data = try? JSONSerialization.data(withJSONObject: result, options: [])
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    guard let datas = data,
                          let response = try? decoder.decode(T.self, from: datas) else {
                            return Result.failure("Result is not a valid JSON object")
                    }
                    return Result.success(response)
                    
                } else {
                    return Result.failure("Result is not a valid JSON object")
                }
            } else {
                return Result.failure("Data processing error")
            }
        }
    }
}

enum CustomError: Error {
    case informationalError
    case redirectionError
    case notFoundError
    case serverError
    case unknownError
}

extension CustomError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .informationalError:
            return "Informational error"
        case .redirectionError:
            return "Redirected"
        case .notFoundError:
            return "Not found"
        case .serverError:
            return "Internal server error"
        default:
            return "Unknown error"
        }
    }
}

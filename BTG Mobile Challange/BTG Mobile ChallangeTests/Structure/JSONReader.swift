//
//  JSONReader.swift
//  BTG Mobile ChallangeTests
//
//  Created by Uriel Barbosa Pinheiro on 22/02/21.
//  Copyright © 2021 Uriel Barbosa Pinheiro. All rights reserved.
//

import Foundation

typealias jsonReaderCallback<T: Decodable> = (Result<T, Error>) -> Void

enum DecodingError: Error {
    case genericError
    case invalidFilePath
}

class JSONReader {

    /// https://stackoverflow.com/questions/24410881/reading-in-a-json-file-using-swift
    static func read<T: Decodable>(_ fileName: String, completion: jsonReaderCallback<T>) {
        if let url = Bundle(for: JSONReader.self).url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                completion(.success(jsonData))
            } catch let error {
                completion(.failure(error))
            }
        } else {
            completion(.failure(DecodingError.invalidFilePath))
        }
    }
}

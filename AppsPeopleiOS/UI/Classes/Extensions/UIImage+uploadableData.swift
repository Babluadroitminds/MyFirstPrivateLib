//
//  UIImage+uploadableData.swift
//  AppsPeopleiOS
//
//  Created by Alexander Karan on 28/06/2018.
//  Copyright © 2019 Apps People. All rights reserved.
//

import UIKit
import Toucan

public enum CompressorError: Error {
    case invalidFormat
    case resizingFailed
}

public enum ImageFormat {
    case png
    case jpeg
}

public extension UIImage {

    func uploadableData(to size: CGSize? = nil, compression: CGFloat = 0.5, format: ImageFormat = .jpeg, completionHandler: @escaping(Result<Data, CompressorError>) -> Void) {
        var uploadableImage = self
        if let size = size {
            guard let resizedImage = self.resized(to: size) else {
                completionHandler(Result.failure(CompressorError.resizingFailed))
                return
            }
            uploadableImage = resizedImage
        }
        DispatchQueue.global(qos: .utility).async {
            var data: Data?
            switch format {
            case .jpeg:
                data = uploadableImage.jpegData(compressionQuality: compression)
            case .png:
                data = uploadableImage.pngData()
            }
            DispatchQueue.main.async {
                guard let data = data else { completionHandler(Result.failure(CompressorError.invalidFormat)); return }
                completionHandler(Result.success(data))
            }
        }
    }

    func resized(to size: CGSize, enlargeIfNeeded: Bool = false) -> UIImage? {
        guard !enlargeIfNeeded, self.size.width > size.width || self.size.height > size.height else {
            return self
        }
        guard let resizedImage = Toucan(image: self).resize(size).image else {
            return nil
        }
        return resizedImage
    }

}

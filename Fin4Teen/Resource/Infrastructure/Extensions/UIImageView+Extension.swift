//
//  UIImageView+Extension.swift
//  Fin4Teen
//
//  Created by Leonardo Portes on 12/06/22.
//

import UIKit

extension UIImageView {
    
    func load(urlString: String) {
        var task: URLSessionDataTask!
        let imageCache = NSCache<AnyObject, AnyObject>()
        
        guard let url: URL = URL(string: urlString) else { return }
        image = nil
        
        if let task = task {
            task.cancel()
        }
        
        if let image = imageCache.object(forKey: url.absoluteString as AnyObject) as? UIImage {
            self.image = image
            return
        }
        
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let newImage = UIImage(data: data) else {
                print("Couldn't load image from url: \(urlString)")
                return
            }
            
            imageCache.setObject(newImage, forKey: url.absoluteString as AnyObject)
            
            DispatchQueue.main.async {
                self.image = newImage
            }
        }
        task.resume()
    }
}

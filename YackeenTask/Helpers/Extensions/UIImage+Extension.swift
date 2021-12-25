//
//  UIImage+Extension.swift
//  YackeenTask
//
//  Created by Ammar.M on 25/12/2021.
//

import UIKit

extension UIImage {
    static func loadFrom(url: String?, completion: @escaping (_ image: UIImage?) -> ()) {
        guard let url = url else {return}
        var main: URL!
        if url.contains("http") {
            main = URL(string: url)
        } else {
            main = URL(string: Router.BASE_URL + (url))
        }
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: main) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}

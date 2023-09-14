//
//  UIImageView + Extension.swift
//  MVVM-ex
//
//  Created by 陳冠甫 on 2023/9/15.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else { return }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}

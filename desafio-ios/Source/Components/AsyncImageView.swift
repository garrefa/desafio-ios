//
//  AsyncImageView.swift
//  desafio-ios
//
//  Created by Cicero Camargo on 08/04/17.
//  Copyright © 2017 Stationfy. All rights reserved.
//

import UIKit
import Alamofire

class AsyncImageView: UIImageView {
    
    var request: Alamofire.DataRequest?
    
    func loadImageFromUrl(_ url: Alamofire.URLConvertible) {
        request = Alamofire.request(url)
        request?.responseData() { [weak self] response in
            if let data = response.result.value, let image = UIImage(data: data), let strongSelf = self {
                strongSelf.setImageAnimated(image)
            }
        }
    }
    
    func setImageAnimated(_ image: UIImage?) {
        DispatchQueue.main.async {
            UIView.transition(
                with: self,
                duration: 0.3,
                options: [.transitionCrossDissolve],
                animations: {
                    self.image = image
                },
                completion: nil
            )
        }
    }
    
    override var image: UIImage? {
        didSet {
            request?.cancel()
            request = nil
        }
    }
}

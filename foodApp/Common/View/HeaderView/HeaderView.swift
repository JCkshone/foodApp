//
//  HeaderView.swift
//  foodApp
//
//  Created by Juan Camilo on 6/12/20.
//

import UIKit

class HeaderView: UIView {
    @IBOutlet private(set) var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView?
    private var cachedMinimumSize: CGSize?
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    private var minimumHeight: CGFloat {
        get {
            guard let scrollView = scrollView else { return 0 }
            if let cachedSize = cachedMinimumSize {
                if cachedSize.width == scrollView.frame.width {
                    return cachedSize.height
                }
            }
      
            let minimumSize = systemLayoutSizeFitting(CGSize(width: scrollView.frame.width, height: 0),
                                                      withHorizontalFittingPriority: .required,
                                                      verticalFittingPriority: .defaultLow)
            cachedMinimumSize = minimumSize
            return minimumSize.height
        }
    }

    func updatePosition() {
        guard let scrollView = scrollView else { return }
        
        let minimumSize = minimumHeight
        
        let referenceOffset = scrollView.safeAreaInsets.top
        let referenceHeight = scrollView.contentInset.top - referenceOffset
        
        let offset = referenceHeight + scrollView.contentOffset.y
        let targetHeight = referenceHeight - offset - referenceOffset
        var targetOffset = referenceOffset
        if targetHeight < minimumSize {
            targetOffset += targetHeight - minimumSize
        }
        
        var headerFrame = frame;
        headerFrame.size.height = max(minimumSize, targetHeight)
        headerFrame.origin.y = targetOffset
        
        frame = headerFrame;
    }
}


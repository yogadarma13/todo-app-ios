//
//  UIViewControllerExtensions.swift
//  ToDo App
//
//  Created by Yoga Darma on 10/01/25.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension UIViewController {
    func showToast(message: String) {
        let toastLabel = UILabel(
            frame: CGRect(
                x: self.view.frame.size.width / 2 - 85,
                y: self.view.frame.size.height - 150, width: 180, height: 40))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.numberOfLines = 1
        toastLabel.textColor = UIColor.white
        toastLabel.font = .systemFont(ofSize: 15.0)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        view.addSubview(toastLabel)
        UIView.animate(
            withDuration: 4.0, delay: 0.1, options: .curveEaseOut,
            animations: {
                toastLabel.alpha = 0.0
            },
            completion: { (isCompleted) in
                toastLabel.removeFromSuperview()
            })
    }
    
    func setupLoadingIndicator() -> NVActivityIndicatorView {
        // Define the frame for the activity indicator
        let frame = CGRect(
            x: (view.frame.width - 50) / 2, y: (view.frame.height - 50) / 2,
            width: 50, height: 50)

        // Initialize the activity indicator
        return NVActivityIndicatorView(
            frame: frame, type: .ballSpinFadeLoader, color: .blue, padding: 10)
    }
    
    func showLoading(activityIndicator: NVActivityIndicatorView) {
        activityIndicator.startAnimating()
    }
    
    func hideLoading(activityIndicator: NVActivityIndicatorView) {
        activityIndicator.stopAnimating()
    }
}

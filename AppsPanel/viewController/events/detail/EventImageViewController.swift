//
//  EventImageViewController.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import UIKit

class EventImageViewController: UIViewController {
    
    @IBOutlet weak var eventImageView: UIImageView!
    
    private var image: UIImage
    
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
}

private extension EventImageViewController {
    
    func setupUI() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeView))
        self.view.addGestureRecognizer(tapGesture)
        
        eventImageView.image = image
    }
    
    @objc
    func removeView() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

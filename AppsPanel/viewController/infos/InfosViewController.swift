//
//  InfosViewController.swift
//  AppsPanel
//
//  Created by Jeremy  Bailly  on 19/06/2021.
//

import UIKit
import WebKit

class InfosViewController: UIViewController {
    
    @IBOutlet weak var infosWKWebView: WKWebView!
    
    private var infoViewModel: InfoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupData()
    }
    
}
private extension InfosViewController {
    func setupData() {
        self.infoViewModel = InfoViewModel(infoRepository: InfoRepository(apiService: ApiService()))
        
        self.infoViewModel?.retrieveStringHtml { stringHtml in
            if let stringHtml = stringHtml {
                DispatchQueue.main.async {
                    self.infosWKWebView.loadHTMLString(stringHtml, baseURL: nil)
                }
            }
        }
    }
    
    func setupUI() {
        self.navigationController?.navigationBar.topItem?.title = "Infos"
    }
}

//
//  CoursesViewController.swift
//  Puc Aberta
//
//  Created by Marcelo Rodrigues dos Santos Junior on 01/05/17.
//  Copyright © 2017 Marcelo Rodrigues dos Santos Junior. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.activityIndicator.startAnimating()
        let requestURL = NSURL(string:"http://www.pucminas.br/Graduacao/Paginas/default.aspx")
        let request = NSURLRequest(url: requestURL as! URL)
        webView.loadRequest(request as URLRequest)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension CoursesViewController: UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        if !webView.isLoading {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
}

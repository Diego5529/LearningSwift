//
//  ViewController.swift
//  MobileB2B
//
//  Created by macmini on 12/22/15.
//  Copyright © 2015 trovata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet var activityLoading: UIActivityIndicatorView!
    @IBOutlet var webViewMaster: UIWebView!
    @IBOutlet var navigationBarMaster: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webViewMaster.hidden = true
        activityLoading.hidden = false
        activityLoading.startAnimating()
        
        //Cria a logo
        let image = UIImage(named: "logo_app.png")
        
        let buttonLogo = UIButton()
        buttonLogo.setImage(image, forState: .Normal)
        buttonLogo.frame = CGRectMake(0, 0, 30, 30)
        buttonLogo.addTarget(self, action: "actionLogoPressed", forControlEvents: .TouchUpInside)
            
        buttonLogo.layer.masksToBounds = true
        buttonLogo.layer.borderColor = UIColor.whiteColor().CGColor
        buttonLogo.layer.cornerRadius = 15
        buttonLogo.clipsToBounds = true
        
        //Exibe a Logo
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = buttonLogo
        self.navigationItem.leftBarButtonItem = rightBarButton
        
        //Botoes da direita
        let actionButton = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "actionButtonActionShare")
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "actionReloadPage")
        let replyButton = UIBarButtonItem(barButtonSystemItem: .Reply, target: self, action: "actionBackPage")
        navigationItem.rightBarButtonItems = [replyButton, refreshButton, actionButton]
        
        setUrlWebView()
    }
    
    func setUrlWebView(){
        let url = NSURL (string: "http://plugt-teste.trovata.com.br")
        let requestObj = NSURLRequest(URL: url!)
        webViewMaster.delegate = self
        webViewMaster.loadRequest(requestObj)
    }
    
    func actionReloadPage()
    {
        print("actionReloadPage")
        webViewMaster.reload();
    }
    
    func actionBackPage()
    {
        print("actionBackPage")
        webViewMaster.goBack();
    }
    
    func actionLogoPressed()
    {
        print("Logo Pressed")
        setUrlWebView()
    }
    
    func actionButtonActionShare()
    {
        let currentURL : NSURL = (webViewMaster.request?.URL?.absoluteURL)!
        print(currentURL)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        webViewMaster.hidden = false
        activityLoading.stopAnimating()
        activityLoading.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
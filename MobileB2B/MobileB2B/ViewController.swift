//
//  ViewController.swift
//  MobileB2B
//
//  Created by macmini on 12/22/15.
//  Copyright © 2015 trovata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webViewMaster: UIWebView!
    @IBOutlet var navigationBarMaster: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Abriu o View Controller...")
        
        //Set URL
        setUrlWebView()
        
        //Cria a logo
        let btnName = UIButton()
        btnName.setImage(UIImage(named: "ImagesPlugtTeste"), forState: .Normal)
        btnName.frame = CGRectMake(0, 0, 40, 40)
        btnName.addTarget(self, action: "actionLogoPressed", forControlEvents: .TouchUpInside)
        
        //Exibe a Logo
        let rightBarButton = UIBarButtonItem()
        rightBarButton.customView = btnName;
        self.navigationItem.leftBarButtonItem = rightBarButton
        
        //Botoes da direita
        let actionButton = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "actionButtonActionShare")
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "actionReloadPage")
        let replyButton = UIBarButtonItem(barButtonSystemItem: .Reply, target: self, action: "actionBackPage")
        navigationItem.rightBarButtonItems = [replyButton, refreshButton, actionButton]
    }
    
    func setUrlWebView(){
        let url = NSURL (string: "http://plugt-teste.trovata.com.br")
        let requestObj = NSURLRequest(URL: url!)
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
    
    override func viewDidAppear(animated: Bool) {
        navigationItem.title = "Mobile B2B Plugt"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
//
//  CustomLoginViewController.swift
//  vkapp
//
//  Created by Vasiliy Kapyshkov on 01.03.2021.
//

import UIKit
import WebKit
import Alamofire

class CustomLoginViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView? {
        didSet {
            webView?.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "7784942"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "scope", value: "262150")
        ]
        
        let request = URLRequest(url: components.url!)
        
        webView?.load(request)
    }
}


extension CustomLoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        guard let userId = params["user_id"], let token = params["access_token"] else {
            decisionHandler(.cancel)
            return
        }
        
        Session.shared.userId = Int(userId)!
        Session.shared.token = token
        
        if let tabVC = storyboard?.instantiateViewController(withIdentifier: "mainTabController") {
            present(tabVC, animated: true, completion: nil)
        }
//        let friendsRequest: Parameters = [
//            "fields": "photo_100"
//        ]
////        VKRequestManager.run(method: .friendsGet, additionalParams: friendsRequest) { (t, er) in
////            print(t)
////        }
//        VKRequestManager<FriendsModel>.request(method: .friendsGet, additionalParams: friendsRequest) { (test1, test2) in
//            print(test1?.response.items)
//        }
        
//        self.vkRequest(method: "friends.get", additionalParams: nil)
//        self.vkRequest(method: "photos.get", additionalParams: nil)
//        self.vkRequest(method: "groups.get", additionalParams: nil)
//
//        let searchParams: Parameters = [
//            "q": "Travis Rice",
//        ]
//        self.vkRequest(method: "groups.search", additionalParams: searchParams)
        
        decisionHandler(.cancel)
    }
}

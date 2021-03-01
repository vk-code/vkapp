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
            URLQueryItem(name: "client_id", value: "7777268"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "scope", value: "262150")
        ]
        
        let request = URLRequest(url: components.url!)
        
        webView?.load(request)
    }
    
    
    func vkRequest(method: String, additionalParams: Parameters?) {
        
        var apiParams: Parameters = [
            "access_token": Session.shared.token,
            "v": "5.130",
        ]
        
        if let additionalParams = additionalParams {
            apiParams = apiParams.merging(additionalParams) { current, _ in current }
        }
        
        AF.request("https://api.vk.com/method/\(method)", method: .get, parameters: apiParams).responseJSON { response in
            switch response.result {
            case let .success(data):
                print(data)
            case let .failure(error):
                print(error)
            }
        }
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
        
        self.vkRequest(method: "friends.get", additionalParams: nil)
        self.vkRequest(method: "photos.get", additionalParams: nil)
        self.vkRequest(method: "groups.get", additionalParams: nil)

        let searchParams: Parameters = [
            "q": "Travis Rice",
        ]
        self.vkRequest(method: "groups.search", additionalParams: searchParams)
        
        decisionHandler(.cancel)
    }
}

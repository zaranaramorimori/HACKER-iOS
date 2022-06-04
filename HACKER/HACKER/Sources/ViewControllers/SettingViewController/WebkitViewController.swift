//
//  CreatorsViewController.swift
//  HACKER
//
//  Created by Danna Lee on 2022/06/02.
//

import UIKit
import WebKit

class WebkitViewController: UIViewController {
  
  var urlString: String = ""
  
  private let navigationBar = HackerNavigationBar()
  private lazy var webView: WKWebView = { createWebView() }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setLayout()
  }
  
  private func createWebView() -> WKWebView {
    let webView = WKWebView()
    let request = URLRequest(url: URL(string: urlString)!)
    webView.load(request)
    view.addSubview(webView)
    return webView
  }
  
  private func setLayout() {
    layoutWebView()
    layoutNavigationBar()
  }
  
  private func layoutWebView() {
    webView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func layoutNavigationBar() {
    view.addSubview(navigationBar)
    navigationBar.backgroundColor = .clear
    navigationBar.iconLayout(isBack: true, logoImage: nil, rightImage: nil)
    navigationBar.popViewController = {
      self.navigationController?.popViewController(animated: true)
    }
    navigationBar.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
      make.height.equalTo(72)
    }
  }
}

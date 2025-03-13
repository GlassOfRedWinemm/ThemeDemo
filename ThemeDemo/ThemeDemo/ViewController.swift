//
//  ViewController.swift
//  ThemeDemo
//
//  Created by Yuezhen Pan on 2025/3/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var midView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    let lightColor = UIColor.lightGray
    let darkColor = UIColor.darkGray
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
        // 监听系统用户界面样式变化的通知
        NotificationCenter.default.addObserver(self, selector: #selector(traitCollectionDidChangeNotification), name: Notification.Name(AppTools.shared.styleSwichNotification), object: nil)
    }
    
    deinit {
        // 移除通知监听
        NotificationCenter.default.removeObserver(self, name: Notification.Name(AppTools.shared.styleSwichNotification), object: nil)
    }
    
    // 处理系统用户界面样式变化的通知
    @objc func traitCollectionDidChangeNotification() {
        updateUI()
    }
    
    // 更新界面颜色
    func updateUI() {
        self.view.backgroundColor = UIColor.color(lightMode: lightColor, darkMode: darkColor, mode: AppTools.style)
        self.midView.backgroundColor = UIColor.color(lightMode: lightColor, darkMode: darkColor, mode: AppTools.style)
    }
    
    /// 模拟设置页手动切换模式（随系统/亮色/暗色）
    @IBAction func onClick(_ sender: UIButton) {
        self.titleLabel.text = sender.titleLabel?.text
        AppTools.style = ColorMode(rawValue: sender.tag) ?? .followSystem
        // 发送系统用户界面样式变化的通知
        NotificationCenter.default.post(name: Notification.Name(AppTools.shared.styleSwichNotification), object: nil)
    }
    
}


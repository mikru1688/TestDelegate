//
//  ViewController.swift
//  TestDelegate
//
//  Created by Frank.Chen on 2017/1/23.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//
import UIKit

class PageA: UIViewController, PageADelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "PageA"
        self.view.backgroundColor = UIColor.white
        
        // 生成切換至PageB的按鈕
        let switchBtn: UIButton = UIButton()
        switchBtn.frame = CGRect(x: self.view.frame.size.width / 2 - 100, y: self.view.frame.size.height / 2 - 25, width: 200, height: 50)
        switchBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        switchBtn.setTitle("切換至PageB", for: .normal)
        switchBtn.setTitleColor(UIColor.white, for: .normal)
        switchBtn.layer.cornerRadius = 10
        switchBtn.backgroundColor = UIColor.darkGray
        switchBtn.addTarget(self, action: #selector(PageA.onClickToPageB(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(switchBtn)
    }
    
    // 切換至PageB
    func onClickToPageB(_ sender: UIButton) {
        let pageB: PageB = PageB()
        pageB.delegate = self // 將協議書交給PageB並依照此協議書上的協議來叫我做事情
        self.navigationController?.pushViewController(pageB, animated: true)
    }
    
    // 提示錯誤訊息
    func alertErrorMsg(errMsg: String) {
        let alertController = UIAlertController(title: "提示", message: errMsg, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "確定", style: .default, handler: nil)
        alertController.addAction(confirm)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Page Delegate
    // ---------------------------------------------------------------------
    // 點擊PageB的cell所會觸發的delegate
    func pageA(_ pageB: PageB, didSelectedData data: String) {
        self.alertErrorMsg(errMsg: data)
    }
    
}

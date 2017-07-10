//
//  PageB.swift
//  TestDelegate
//
//  Created by Frank.Chen on 2017/1/23.
//  Copyright © 2017年 Frank.Chen. All rights reserved.
//

import UIKit

class PageB: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var delegate: PageBDelegate! // delegate
    var testDataTV: UITableView!
    var dataList: [String] = ["Apple", "Banana", "Cherry"] // 畫面上顯示的資料
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "PageB"
        
        // 產生tableVeiw
        self.testDataTV = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .plain)
        self.testDataTV?.backgroundColor = UIColor.white
        self.testDataTV?.delegate = self
        self.testDataTV?.dataSource = self
        self.view.addSubview(self.testDataTV!)                
    }
    
    // MARK: - DataSource
    // ---------------------------------------------------------------------
    // 設定表格section的列數
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    // 表格的儲存格設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var testCell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if testCell == nil {
            testCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
            testCell?.selectionStyle = UITableViewCellSelectionStyle.none // 選取的時侯無背景色
            testCell?.textLabel?.font = UIFont.systemFont(ofSize: 30)
        }
        
        testCell!.textLabel?.text = dataList[indexPath.row]
        
        return testCell!
    }
    
    // MARK: - Delegate
    // ---------------------------------------------------------------------
    // 設定cell的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // 點選儲存格事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = self.navigationController?.popViewController(animated: true) // 關閉此頁面
        self.delegate.pageB(self, didSelectData: self.dataList[indexPath.row]) // 呼叫PageA的selectedRow方法
    }
    
}

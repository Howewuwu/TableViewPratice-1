//
//  PokeItemDetailViewController.swift
//  TableViewPratice-1
//
//  Created by Howe on 2024/2/14.
//

import UIKit

// 定義一個繼承自UIViewController的類別，用於展示寶可夢物品的詳細信息
class PokeItemDetailViewController: UIViewController {
    
    // 提供一個靜態屬性來返回這個類的重用標識符，通常用於故事板中識別視圖控制器
    static var reuseIdentifier: String { "\(Self.self)" }
    
    // 定義一個可選的Item型別的變數，用於存儲從上一個視圖控制器傳遞過來的物品詳情
    var item: Item!
    
    // 使用IBOutlet標記的幾個UI元件，用於顯示物品的名稱、圖片、描述和其他語言的描述
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemDescription: UITextView!
    @IBOutlet weak var otherLangurage: UITextView!
    
    // 視圖加載完成後調用的方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 確保 item 不為nil後，使用它來更新 UI 元件
        update(item: item)
    }
    
    // 定義一個方法用於根據傳入的Item物品來更新視圖中的UI元件
    func update(item: Item) {
        // 設置物品名稱
        itemName?.text = item.name
        // 設置物品圖片，這裡假定圖片名與物品名相同
        itemImageView?.image = UIImage(named: item.name)
        // 設置物品描述
        itemDescription?.text = item.description
        // 設置物品的其他語言描述
        otherLangurage?.text = item.otherLangurage
    }
}

/*
 注意，在update(item:)方法中使用了可選鏈式調用（例如itemName?.text）
 這是因為在視圖控制器的生命周期中，這些UI元件可能還未被加載，所以它們是可選的。這種寫法確保了即使在UI元件尚未準備好時嘗試訪問它們也不會導致崩潰。
 */

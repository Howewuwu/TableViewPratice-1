//
//  categoryMedicineTableViewCell.swift
//  TableViewPratice-1
//
//  Created by Howe on 2024/2/15.
//

import UIKit

// 定義一個繼承自UITableViewCell的類別，用於展示醫療類物品
class categoryMedicineTableViewCell: UITableViewCell {
    
    
    // 通過IBOutlet連接的UI元件，分別為物品的名稱標籤、圖片視圖和詳情按鈕
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var detailButton: DetailButton!
    
    
    // 更新單元格內容的方法，根據傳入的Item實例來設置UI元件
    func update(item: Item) {
        
        // 根據物品的imageName屬性來設置圖片視圖的圖片
        itemImageView.image = UIImage(named: item.imageName)
        // 設置物品名稱標籤的文本
        itemNameLabel.text = item.name
        // 將物品的id設置給詳情按鈕的rowID屬性，以便於後續識別是哪個物品的詳情按鈕被點擊
        detailButton.rowID = item.id
    }
    
    
    // 單元格從故事板載入後的初始化操作
    override func awakeFromNib() {
        super.awakeFromNib()
        // 這裡可以添加一些初始化代碼，如設置視覺風格等
    }
    
    
    // 設置單元格選中狀態的方法
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // 這裡可以根據需要添加選中或取消選中時的額外處理，如改變背景顏色等
    }
}

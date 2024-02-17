//
//  PokeItemTableViewCell.swift
//  TableViewPratice-1
//
//  Created by Howe on 2024/2/14.
//

import UIKit


// 定義一個協議，用於當單元格中的詳情按鈕被點擊時通知代理執行相應的動作
protocol categoryBallTableViewCellDelegate: AnyObject {
    func detailButtonTap(sender: DetailButton)
}


// 自定義表格視圖單元格類別，用於展示寶可夢球類物品
class categoryBallTableViewCell: UITableViewCell {
    
    // UI元件的宣告，包括物品圖像、名稱標籤和詳情按鈕
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var detailButton: DetailButton!
    
    
    // 宣告一個代理變數，遵循categoryBallTableViewCellDelegate協議
    // 使用weak關鍵字防止循環引用
    weak var delegate: categoryBallTableViewCellDelegate?
    
    
    // 更新單元格內容的方法，根據傳入的Item實例來設置UI元件
    func update(item: Item) {
        
        itemImageView.image = UIImage(named: item.imageName)
        itemNameLabel.text = item.name
        
        // 將物品的id設置給詳情按鈕的rowID屬性，這樣點擊時可以知道是哪個物品被選擇
        detailButton.rowID = item.id
    }
    
    
    // 單元格從故事板載入後的初始化操作
    override func awakeFromNib() {
        super.awakeFromNib()
        // 這裡可以添加一些初始化代碼
    }
    
    
    // 設置單元格選中狀態的方法，這裡可以根據需要來自定義選中效果
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // 這裡可以添加選中或取消選中時的額外處理
    }
    
    
    // 詳情按鈕點擊事件的處理方法，當按鈕被點擊時，通過代理來執行相應的動作
    @IBAction func detailButtonTap(_ sender: DetailButton) {
        // 通知代理執行detailButtonTap方法
        delegate?.detailButtonTap(sender: sender)
    }
}

//
//  DetailButton.swift
//  TableViewPratice-1
//
//  Created by Howe on 2024/2/15.
//

import UIKit

// 自定義一個DetailButton類，繼承自UIButton
class DetailButton: UIButton {
    
    // 添加一個sectionID屬性，用來存儲與按鈕相關的PokemonItem的ID
    // 這使得在按鈕的事件處理中，能夠確定按鈕屬於哪一個section
    var sectionID: PokemonItem.ID?
    
    // 添加一個rowID屬性，用來存儲與按鈕相關的Item的ID
    // 這樣在處理按鈕事件時，可以知道是哪一個具體的Item觸發了事件
    var rowID: Item.ID?
    
}


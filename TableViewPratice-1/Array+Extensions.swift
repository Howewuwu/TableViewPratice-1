//
//  Array+Extensions.swift
//  TableViewPratice-1
//
//  Created by Howe on 2024/2/16.
//

import UIKit


// 擴展 Array 類型，但這個擴展僅適用於其元素遵循 Identifiable 協議的情況
// Identifiable 是 Swift 標準庫中的一個協議，要求實現它的類型提供一個唯一標識符（id）
extension Array where Element: Identifiable {
    
    // 定義一個方法，接受一個 Identifiable 協議中定義的 ID 類型的參數
    // 此方法的目的是找到數組中具有給定 ID 的元素的索引
    func indexOfElement(with id: Element.ID) -> Self.Index {
        
        // 使用 firstIndex(where:) 方法來尋找第一個 ID 匹配給定ID的元素的索引
        // $0.id == id 這部分是一個閉包，用於比較每個元素的 id 與傳入的 id 是否相同
        guard let index = firstIndex(where: { $0.id == id }) else {
            
            // 如果找不到匹配的元素，則使用 fatalError() 拋出一個運行時錯誤
            // 在實際開發中，拋出錯誤可能不是最好的選擇，你可能會選擇返回nil或進行其他處理
            fatalError()
        }
        return index
    }
}


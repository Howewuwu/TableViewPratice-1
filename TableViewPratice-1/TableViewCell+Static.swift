//
//  TableViewCell+Static.swift
//  TableViewPratice-1
//
//  Created by Howe on 2024/2/14.
//

import UIKit

// 為categoryBallTableViewCell添加一個擴展
extension categoryBallTableViewCell {
    
    // 添加一個靜態屬性reuseIdentifier，用於返回該類型的唯一標識符
    // 這裡使用"\(Self.self)"是Swift中的一種反射機制，用於獲取當前類型的名稱
    // 這樣做可以確保每個UITableViewCell子類都有一個與其類名相同的重用標識符
    static var reuseIdentifier: String { "\(Self.self)" }
}

// 為categoryMedicineTableViewCell添加一個擴展，內容與上面相同
extension categoryMedicineTableViewCell {
    static var reuseIdentifier: String { "\(Self.self)" }
}


/*
 使用這種方式來定義reuseIdentifier有幾個好處：
 1.減少錯誤：直接使用類名作為標識符，避免了手動字符串錯誤的可能性。
 2.提高可維護性：如果類名發生變化，標識符也會自動更新，不需要手動修改。
 3.增強可讀性和一致性：這樣的命名慣例讓代碼更加清晰，也使得在整個項目中尋找和使用這些標識符變得更加容易。
 */

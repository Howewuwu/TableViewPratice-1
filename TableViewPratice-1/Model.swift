//
//  Model.swift
//  TableViewPratice-1
//
//  Created by Howe on 2024/2/14.
//

import Foundation

struct PokemonItem {
    let category: String
    let item: [Item]
}


struct Item: Identifiable {
    
    var id = UUID()
    
    let name: String
    let imageName: String
    let description: String
    let otherLangurage: String
}



extension PokemonItem {
    
    static var pokemonItems: [PokemonItem] {
        
        let pokeBall = Item(name: "poke-ball", imageName: "poke-ball", description: "Catches wild Pokémon.", otherLangurage: """
    English   Poké Ball
    Japanese  モンスターボール
    German    Pokéball
    French    Poké Ball
    Italian   Poké Ball
    Spanish   Poké Ball
    Korean    몬스터볼
    Chinese (Simplified)    精灵球
    Chinese (Traditional)   精靈球
    """)
        
        let greatBall = Item(name: "great-ball", imageName: "great-ball", description: "Catches wild Pokémon with 1.5x the rate of a Poké Ball.", otherLangurage: """
        English   Great Ball
        Japanese  スーパーボール
        German    Superball
        French    Super Ball
        Italian   Mega Ball
        Spanish   Super Ball
        Korean    슈퍼볼
        Chinese (Simplified)    超级球
        Chinese (Traditional)   超級球
        """)
        
        let ultraBall = Item(name: "ultra-ball", imageName: "ultra-ball", description: "Catches wild Pokémon with 2x the rate of a Poké Ball.", otherLangurage: """
        English   Ultra Ball
        Japanese  ハイパーボール
        German    Hyperball
        French    Hyper Ball
        Italian   Ultra Ball
        Spanish   Ultra Ball
        Korean    하이퍼볼
        Chinese (Simplified)    高级球
        Chinese (Traditional)   高級球
        """)
        
        let beastBall = Item(name: "beast-ball", imageName: "beast-ball", description: "A special Poké Ball designed to catch Ultra Beasts. It has a low success rate for catching others.", otherLangurage: """
        English   Beast Ball
        Japanese  ウルトラボール
        German    Ultraball
        French    Ultra Ball
        Italian   UC Ball
        Spanish   Ente Ball
        Korean    울트라볼
        Chinese (Simplified)    究极球
        Chinese (Traditional)   究極球
        """)
        
        let masterBall = Item(name: "master-ball", imageName: "master-ball", description: "Catches any wild Pokémon without fail.", otherLangurage: """
        English   Master Ball
        Japanese  マスターボール
        German    Meisterball
        French    Master Ball
        Italian   Master Ball
        Spanish   Master Ball
        Korean    마스터볼
        Chinese (Simplified)    大师球
        Chinese (Traditional)   大師球
        """)
        
        let ballCategory = PokemonItem(category: "Ball", item: [pokeBall, greatBall, ultraBall, beastBall, masterBall])
        
        
        let antidote = Item(name: "antidote", imageName: "antidote", description: "Cures a Pokémon of poisoning.", otherLangurage: """
        English   Antidote
        Japanese  どくけし
        German    Gegengift
        French    Antidote
        Italian   Antidoto
        Spanish   Antídoto
        Korean    해독제
        Chinese (Simplified)    解毒药
        Chinese (Traditional)   解毒藥
        """)
        
        let awakening = Item(name: "awakening", imageName: "awakening", description: "Wakes up a sleeping Pokémon.", otherLangurage: """
        English   Awakening
        Japanese  ねむけざまし
        German    Aufwecker
        French    Réveil
        Italian   Sveglia
        Spanish   Despertar
        Korean    잠깨는약
        Chinese (Simplified)    解眠药
        Chinese (Traditional)   解眠藥
        """)
        
        let burnHeal = Item(name: "burn-heal", imageName: "burn-heal", description: "Cures a Pokémon of a burn.", otherLangurage: """
        English   Burn Heal
        Japanese  やけどなおし
        German    Feuerheiler
        French    Anti-Brûle
        Italian   Antiscottatura
        Spanish   Antiquemar
        Korean    화상치료제
        Chinese (Simplified)    灼伤药
        Chinese (Traditional)   灼傷藥
        """)
        
        let iceHeal = Item(name: "ice-heal", imageName: "ice-heal", description: "Cures a Pokémon of freezing.", otherLangurage: """
        English   Ice Heal
        Japanese  こおりなおし
        German    Eisheiler
        French    Antigel
        Italian   Antigelo
        Spanish   Antihielo
        Korean    얼음상태치료제
        Chinese (Simplified)    解冻药
        Chinese (Traditional)   解凍藥
        """)
        
        let fullHeal = Item(name: "full-heal", imageName: "full-heal", description: "Cures a Pokémon of any status condition.", otherLangurage: """
        English   Full Heal
        Japanese  なんでもなおし
        German    Hyperheiler
        French    Total Soin
        Italian   Cura totale
        Spanish   Cura Total
        Korean    만병통치제
        Chinese (Simplified)    万灵药
        Chinese (Traditional)   萬靈藥
        """)
        
        let fullRestore = Item(name: "full-restore", imageName: "full-restore", description: "Fully restores HP and cures any status condition of a Pokémon.", otherLangurage: """
        English   Full Restore
        Japanese  かいふくのくすり
        German    Top-Genesung
        French    Guérison
        Italian   Ricarica totale
        Spanish   Restaurar Todo
        Korean    회복약
        Chinese (Simplified)    全复药
        Chinese (Traditional)   全復藥
        """)
       
        let medicineCategory = PokemonItem(category: "Medicine", item: [antidote, awakening, burnHeal, iceHeal, fullHeal, fullRestore])
        
        return [ballCategory, medicineCategory ]
        
    }
    
}

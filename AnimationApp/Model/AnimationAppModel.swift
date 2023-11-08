//
//  AnimationAppModel.swift
//  AnimationApp
//
//  Created by deshollow on 08.11.2023.
//

struct Animation {
    
    var preset: String
    var curve: String
    
    var force: Double
    var duration: Double
    var delay: Double
    
    
    static func getAnimations() -> [Animation] {
        let valuesData = ValuesData()
        
        var array: [Animation] = []
        
        for item in 0..<valuesData.preset.count {
            array.append(Animation(
                preset: valuesData.preset[item],
                curve: valuesData.curve[item],
                force: valuesData.force[item],
                duration: valuesData.duration[item],
                delay: valuesData.delay[item])
            )
        }
        return array
    }
    
    static func getDefaultValues() -> Animation {
        Animation(preset:"empty preset", curve: "empty curve", force: 0.0, duration: 0.0, delay: 0.0)
    }
}

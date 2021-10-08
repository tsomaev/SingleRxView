//
//  BenefitsTypeEnum.swift
//  SingleView
//
//  Created by Soslan-Bek Tsomaev on 18.06.2021.
//

import Foundation
import UIKit

enum BenefitsTypeEnum: CaseIterable {
    case first
    case second
    case third
    case four
    
    var title: String {
        switch self {
        case .first: return "First"
        case .second: return "Second"
        case .third: return "Third"
        case .four: return "Four"
        }
    }
    
    var description: String {
        switch self {
        case .first: return "First desc"
        case .second: return "Second desc"
        case .third: return "Third desc"
        case .four: return "Four desc"
        }
    }
    
    var icon: UIImage {
        return UIImage(systemName: "scribble")!
    }
}

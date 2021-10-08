//
//  MainViewModel.swift
//  SingleView
//
//  Created by Soslan-Bek Tsomaev on 18.06.2021.
//

import Foundation
import RxCocoa
import RxSwift

final class MainViewModel: MainViewModelType {
    
    var purchases = BehaviorRelay<[String]>(value: ["First", "Second", "Third"])
    var collectionViewDataSource = BehaviorRelay<[BenefitsTypeEnum]>(value: BenefitsTypeEnum.allCases)
    
    // MARK: - Constructor
    init() {
    }
}

// MARK: -
extension MainViewModel: MainViewModelInput {
    
}

// MARK: -
extension MainViewModel: MainViewModelOutput {
    
}


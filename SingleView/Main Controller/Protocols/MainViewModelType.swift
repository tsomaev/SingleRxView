//
//  MainViewModelType.swift
//  SingleView
//
//  Created by Soslan-Bek Tsomaev on 18.06.2021.
//

import Foundation
import RxCocoa

protocol MainViewModelInput {
    
}

protocol MainViewModelOutput {
    var purchases: BehaviorRelay<[String]> { get }
    var collectionViewDataSource: BehaviorRelay<[BenefitsTypeEnum]> { get }
}

protocol MainViewModelType {
    var input: MainViewModelInput { get }
    var output: MainViewModelOutput { get }
}

extension MainViewModelType where Self: MainViewModelInput & MainViewModelOutput {
    var input: MainViewModelInput { return self }
    var output: MainViewModelOutput { return self }
}

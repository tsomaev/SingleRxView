//
//  BenefitTypeCell.swift
//  SingleView
//
//  Created by Soslan-Bek Tsomaev on 18.06.2021.
//

import UIKit
import SnapKit

protocol FillableProtocol {
    associatedtype DataType
    
    func fill(_ data:DataType)
}


final class BenefitTypeCell: UICollectionViewCell, FillableProtocol {
    
    typealias DataType = ViewModel
    struct ViewModel {
        let title: String
        let description: String
        let iconImage: UIImage
    }
    
    class var identifier: String {
        return String(describing: self)
    }
    
    // MARK: - UI
    private let wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Constructor
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
    
    //
    func configure() {
        setUIViews()
    }
    
    //
    func fill(_ data: DataType) {
        titleLabel.text = data.title
        iconImageView.image = data.iconImage
        descriptionLabel.text = data.description
    }
}

// MARK: - Setup
private extension BenefitTypeCell {
    func setUIViews() {
        contentView.addSubview(wrapperView)
        wrapperView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        wrapperView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.top.equalTo(contentView.safeAreaLayoutGuide.snp.top).offset(12)
        }
        
        wrapperView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
        }

        wrapperView.addSubview(iconImageView)
        iconImageView.snp.makeConstraints {
            $0.height.width.equalTo(120)
            $0.centerY.centerX.equalToSuperview()
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(40)
        }
    }
}

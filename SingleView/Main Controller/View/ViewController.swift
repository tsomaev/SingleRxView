//
//  ViewController.swift
//  SingleView
//
//  Created by Soslan-Bek Tsomaev on 18.06.2021.
//

import UIKit
import RxSwift

final class ViewController: UIViewController {
    
    var viewModel: MainViewModelType!
    var layoutCollection: UICollectionViewFlowLayout!
    
    // MARK: -
    private let bag = DisposeBag()
    
    // MARK: - UI
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: UICollectionViewLayout())
        collectionView.backgroundColor = .lightGray
        collectionView.register(BenefitTypeCell.self,
                                forCellWithReuseIdentifier: BenefitTypeCell.identifier)
        return collectionView
    }()
    
    private let bottomView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let purchaseStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
           
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    } 
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layoutCollectionViewSetup()
    }
}

// MARK: - ColletionView Binding
extension ViewController {
    func collectionViewBind() {
        viewModel.output.collectionViewDataSource
            .bind(to: collectionView.rx.items(cellIdentifier: BenefitTypeCell.identifier,
                                              cellType: BenefitTypeCell.self)) { row, item, cell in
                let model = BenefitTypeCell.ViewModel(title: item.title,
                                                      description: item.description,
                                                      iconImage: item.icon)
                cell.fill(model)
            }.disposed(by: bag)
    }
}

// MARK: - Setup
private extension ViewController {
    func setup() {
        setupUIViews()
        collectionViewBind()
        viewModelSubscribe()
    }
    
    func purchaseButtons(_ array: [String]) -> [UIButton] {
        var buttons: [UIButton] = []
        
        array.forEach {
            let button = UIButton()
            button.setTitleColor(.black, for: .normal)
            button.setTitle($0, for: .normal)
            buttons.append(button)
        }
        
        return buttons
    }
    
    func viewModelSubscribe() {
        viewModel.output.purchases.asObservable()
            .map { self.purchaseButtons($0) }
            .subscribe(onNext: { [weak self] purchases in
                guard let `self` = self else { return }
                purchases.forEach {
                    self.purchaseStackView.addArrangedSubview($0)
                }
            }).disposed(by: bag)
    }
    
    func setupUIViews() {
//        view.addSubview(scrollView)
//        scrollView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//
//        scrollView.addSubview(wrapperView)
//        wrapperView.snp.makeConstraints {            
//        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.left.right.equalToSuperview().offset(0)
            $0.height.equalToSuperview().multipliedBy(0.6)
        }
        
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom)
            $0.bottom.left.right.equalToSuperview().offset(0)
        }
        
        bottomView.addSubview(purchaseStackView)
        purchaseStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func layoutCollectionViewSetup() {
        layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.scrollDirection = .horizontal
        
        let height = collectionView.frame.height
        let widht = collectionView.frame.width
        layoutCollection.itemSize = CGSize(width: widht, height: height)
        collectionView.collectionViewLayout = layoutCollection
        collectionView.collectionViewLayout.invalidateLayout()
    }
}


//    func layoutCollectionSetup() {
//        layoutCollection = UICollectionViewFlowLayout()
//        layoutCollection.scrollDirection = .horizontal
//        layoutCollection.sectionInset.left = 20.0
//        layoutCollection.sectionInset.right = 20.0
//
//        let width = (self.collectionView.bounds.width - (layoutCollection.sectionInset.left + layoutCollection.sectionInset.right))
//        layoutCollection.itemSize = CGSize(width: width, height: 180)
//        collectionView.clipsToBounds = true
//        collectionView.isPagingEnabled = true
//        collectionView.collectionViewLayout = layoutCollection
//        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
//    }

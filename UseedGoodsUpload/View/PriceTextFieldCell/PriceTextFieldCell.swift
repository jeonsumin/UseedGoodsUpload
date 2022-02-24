//
//  PriceTextFieldCell.swift
//  UseedGoodsUpload
//
//  Created by Terry on 2022/02/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class PriceTextFieldCell: BaseTableViewCell {
    let priceInputField = UITextField()
    let freeShareButton = UIButton()
    
    func bind(_ viewModel: PriceTextFieldCellViewModel){
        viewModel.showFreeShareButton
            .map{ !$0 }
            .emit(to: freeShareButton.rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel.resetPrice
            .map { _ in "" }
            .emit(to: priceInputField.rx.text)
            .disposed(by: disposeBag)
        
        priceInputField.rx.text
            .bind(to: viewModel.priceValue)
            .disposed(by: disposeBag)
        
        freeShareButton.rx.tap
            .bind(to: viewModel.freeShareButtonTapped)
            .disposed(by: disposeBag)
    }
    
    override func attribute() {
        freeShareButton.setTitle("무료나눔", for: .normal)
        freeShareButton.setTitleColor(.orange, for: .normal)
        freeShareButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        freeShareButton.titleLabel?.font = .systemFont(ofSize: 18)
        freeShareButton.tintColor = .orange
        freeShareButton.backgroundColor = .white
        freeShareButton.layer.borderColor = UIColor.orange.cgColor
        freeShareButton.layer.borderWidth = 1.0
        freeShareButton.layer.cornerRadius = 10.0
        freeShareButton.clipsToBounds = true
        freeShareButton.isHidden = true
        freeShareButton.semanticContentAttribute = .forceRightToLeft
        
        priceInputField.keyboardType = .numberPad
        priceInputField.font = .systemFont(ofSize: 17)
    }
    
    override func layout() {
        [priceInputField,freeShareButton].forEach{contentView.addSubview($0)}
        
        priceInputField.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(20)
        }
        freeShareButton.snp.makeConstraints{
            $0.top.bottom.leading.equalToSuperview().inset(15)
            $0.width.equalTo(100)
        }
    }
}

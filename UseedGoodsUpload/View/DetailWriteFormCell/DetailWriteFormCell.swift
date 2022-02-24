//
//  DetailWriteFormCell.swift
//  UseedGoodsUpload
//
//  Created by Terry on 2022/02/24.
//

import UIKit
import RxSwift
import RxCocoa

class DetailWriteFormCell: BaseTableViewCell {
    
    let contentInputView = UITextView()
    
    func bind(_ viewModel: DetailWriteFormCellViewModel){
        contentInputView.rx.text
            .bind(to: viewModel.contentValue)
            .disposed(by: disposeBag)
    }
    override func attribute() {
        contentInputView.font = .systemFont(ofSize: 17)
    }
    override func layout() {
        contentView.addSubview(contentInputView)
        contentInputView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(300)
        }
    }
    
}

//
//  TitleTextFieldCell.swift
//  UseedGoodsUpload
//
//  Created by Terry on 2022/02/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa


class TitleTextFieldCell: BaseTableViewCell{
    
    let titleInputField = UITextField()
    
    func bind(_ viewModel: TitleTextFieldViewModel){
        titleInputField.rx.text
            .bind(to: viewModel.titleText).disposed(by: disposeBag)
    }
    
    override func attribute() {
        titleInputField.font = .systemFont(ofSize: 17)
    }
    
    override func layout() {
        contentView.addSubview(titleInputField)
        titleInputField.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(20)
        }
    }
}

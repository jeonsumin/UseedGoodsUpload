//
//  PriceTextFieldCellViewModel.swift
//  UseedGoodsUpload
//
//  Created by Terry on 2022/02/24.
//

import RxCocoa
import RxSwift

struct PriceTextFieldCellViewModel {
    //ViewModel -> View
    let showFreeShareButton: Signal<Bool>
    let resetPrice: Signal<Void>
    
    //View -> ViewModel
    let priceValue = PublishRelay<String?>()
    let freeShareButtonTapped = PublishRelay<Void>()
    
    init(){
        showFreeShareButton = Observable
            .merge(
                priceValue.map { $0 ?? "" == "0" },
                freeShareButtonTapped.map { _ in false }
            ).asSignal(onErrorJustReturn: false)
        resetPrice = freeShareButtonTapped
            .asSignal(onErrorSignalWith: .empty())
    }
}

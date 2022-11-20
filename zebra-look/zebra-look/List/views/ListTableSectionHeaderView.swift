//
//  ListTableSectionHeaderView.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/20.
//

import UIKit

class ListTableSectionHeaderView: UIView {

  
    static func loadXibView() -> ListTableSectionHeaderView {
        
        let view = Bundle.main.loadNibNamed("ListTableSectionHeaderView", owner: nil)?.first as! ListTableSectionHeaderView
        return view
    }
    

}

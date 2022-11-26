//
//  NavSearchView.swift
//  zebra-look
//
//  Created by alexiuce on 2022/10/30.
//

import UIKit


class NavSearchView: UIView {

  // UI
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var searchImgView: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    
    // Layout
    
    @IBOutlet weak var leftPadingLayout: NSLayoutConstraint!
    
    
    static func loadXibView() -> NavSearchView {
        
        let view = Bundle.main.loadNibNamed("NavSearchView", owner: nil)?.first as! NavSearchView
        
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 34, height: 32)
       
        
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
      
        
        return view
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 34, height: 32)
    }
    
    override  func awakeFromNib() {
        super.awakeFromNib()
        
        
        cancelButton.isHidden = true
        searchTextField.addTarget(self, action: #selector(changedSearchText), for: .editingChanged)
        
        leftPadingLayout.constant = (UIScreen.main.bounds.width - 34 - 120) * 0.5
       
        
    
    }
    
    
    @IBAction func clickedButton(_ sender: UIButton) {
        if sender.currentTitle == "关闭" {
            searchTextField.endEditing(true)
            UIView.animate(withDuration: 0.35, delay: 0) {
                self.cancelButton.isHidden = true
                self.leftPadingLayout.constant = (UIScreen.main.bounds.width - 34 - 120) * 0.5
                self.layoutIfNeeded()
            }
            
        }
        // 搜索内容
        
        
    }
    

}


extension NavSearchView {
     @objc fileprivate func changedSearchText(){
         print(searchTextField.text ?? "")
         guard let st = searchTextField.text else { return  }
         let btn_title = st.count > 0 ? "搜索":"关闭"
         cancelButton.setTitle(btn_title, for: .normal)
    }
}


extension NavSearchView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        cancelButton.isHidden = false
        UIView.animate(withDuration: 0.35, delay: 0) {
            self.leftPadingLayout.constant = 20
            self.layoutIfNeeded()
        }
    }
}

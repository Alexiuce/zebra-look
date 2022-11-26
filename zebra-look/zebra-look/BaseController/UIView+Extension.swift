//
//  UIView+Extension.swift
//  zebra-look
//
//  Created by alexiuce on 2022/11/22.
//

import UIKit

//方便获取坐标
extension UIView {
    
    /// x
    var x : CGFloat {
        get{
            return frame.origin.x
        }
        set(newValue){
            var tempFrame = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }
    
    /// y
    var y: CGFloat {
        get{
            return frame.origin.y
        }
        set(newValue){
            var tempFrame = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
    }
    
    /// width
    var width: CGFloat {
        get{
            return frame.size.width
        }
        set(newValue){
            var tempFrame = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    /// height
    var height: CGFloat {
        get{
            return frame.size.height
        }
        set(newValue){
            var tempFrame = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
    }
    
    /// size
    var size: CGSize {
        get{
            return frame.size
        }
        set(newValue){
            var tempFrame = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    /// centerX
    var centerX : CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    /// centerY
    var centerY : CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter = center
            tempCenter.y = newValue
            center = tempCenter
        }
    }
    
    var max_x : CGFloat {
        get{
            return frame.origin.x + frame.width
        }
    }
    
    var max_y : CGFloat {
        get{
            return frame.origin.y + frame.height
        }
    }
    
    func getImageFromView() -> UIImageView {
        //区域大小,是否是非透明的,第三个参数屏幕密度了
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        self.layer.render(in: context!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIImageView(image: image!)
    }
}

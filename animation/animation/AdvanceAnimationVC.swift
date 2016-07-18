//
//  AdvanceAnimationVC.swift
//  animation
//
//  Created by XQ on 16/7/4.
//  Copyright © 2016年 XQ. All rights reserved.
//

import UIKit

class AdvanceAnimationVC: UIViewController {
    // MARK: - 声明属性
    // 屏幕高度
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
    // 屏幕宽度
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
    // 按钮的背景view
    let btnBG = UIView()
    // 按钮文字数组
    let btnNames = ["矩形运动", "圆形运动", "渐变效果", "转场动画", "弹簧动画", "组合动画"]
    // 用来测试的view
    let testView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        self.initView()
        self.initBtns()
    }
    func initView() {
        btnBG.frame = CGRectMake(0, 20, SCREEN_WIDTH, 150)
        btnBG.backgroundColor = UIColor.greenColor()
        self.view.addSubview(btnBG)
        
        testView.frame = CGRectMake(20, 300, 100, 100)
        testView.layer.masksToBounds = true
        testView.image = UIImage(named: "34.jpg")
        self.view.addSubview(testView)
    }
    func initBtns() {
        for (index,name) in btnNames.enumerate() {
            let btn = UIButton(type: .Custom)
            
            btn.frame  = CGRectMake((CGFloat)(index % 4 * 95) + 10, (CGFloat)(index / 4 * 60) + 10, 90, 55)
            btn.tag = 100 + index
            btn.backgroundColor = UIColor.redColor()
            btn.setTitle(name, forState: .Normal)
            btn.addTarget(self, action: "animation:", forControlEvents: .TouchUpInside)
            btnBG.addSubview(btn)
        }
    }
    // 按钮点击事件
    func animation(sender:UIButton) {
        switch sender.tag - 100{
        case 0:
            rectangle()
        case 1:
            circular()
        case 2:
            gradual()
        case 3:
            transition()
        case 4:
            spring()
        case 5:
            groups()
        default:break
            
        }
    }

    func rectangle(){
        let ani:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
        ani.duration = 3.0
        ani.delegate = self
        ani.removedOnCompletion = false
        ani.fillMode = kCAFillModeForwards
        let value1 = NSValue.init(CGPoint: CGPointMake(80, 380))
        let value2 = NSValue.init(CGPoint: CGPointMake(300, 380))
        let value3 = NSValue.init(CGPoint: CGPointMake(300, 600))
        let value4 = NSValue.init(CGPoint: CGPointMake(80, 600))
        let value5 = NSValue.init(CGPoint: CGPointMake(80, 380))
        ani.values = [value1, value2,value3, value4, value5]
        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func circular(){
        let ani:CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
        ani.duration = 3.0
        ani.delegate = self
        ani.removedOnCompletion = false
        ani.fillMode = kCAFillModeForwards
        let path:CGMutablePathRef = CGPathCreateMutable()
        CGPathAddEllipseInRect(path, nil, CGRectMake(30, 300, 300, 300))
        ani.path = path
        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func gradual(){
        let ani:CATransition = CATransition()
//        kCATransitionFade 渐变
//        kCATransitionMoveIn 覆盖
//        kCATransitionPush 推出
//        kCATransitionReveal 揭开
        //ani.type = kCATransitionPush
        ani.type = "rippleEffect"
//        kCATransitionFromRight 从右边
//        kCATransitionFromLeft 从左边
//        kCATransitionFromTop 从顶部
//        kCATransitionFromBottom 从底部
        ani.subtype = kCATransitionFromLeft
        ani.duration = 3.0
        ani.delegate = self
        ani.fillMode = kCAFillModeForwards
        ani.removedOnCompletion = false
        self.testView.image = UIImage(named: "12")
        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func transition(){
        let ani:CATransition = CATransition()
//       rippleEffect
//        cube
//        pageCurl
        ani.type = "suckEffect"
        ani.subtype = kCATransitionFromLeft
        ani.duration = 2.0
        ani.delegate = self
        ani.fillMode = kCAFillModeForwards
        ani.removedOnCompletion = false
        self.testView.image = UIImage(named: "12")
        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func spring(){
        let ani:CASpringAnimation = CASpringAnimation(keyPath: "bounds")
        // 弹簧质量,影响惯性
        ani.mass = 10
        // 刚度系数,数值越大,产生形变的力越大,运动越快
        ani.stiffness = 5000
        // 阻尼系数,越大停止越快
        ani.damping = 100
        // 初始速度
        ani.initialVelocity = 5
        ani.delegate = self
        ani.toValue = NSValue.init(CGRect: CGRectMake(0, 0, 400, 400))
        ani.duration = ani.settlingDuration
        ani.removedOnCompletion = false
        ani.fillMode = kCAFillModeForwards
        self.testView.layer.addAnimation(ani, forKey: nil)
        
    }
    func groups(){
        // 位置
        let ani = CABasicAnimation(keyPath: "transform.rotation.z")
        ani.toValue = NSNumber.init(double: M_PI)
        // 弹簧
        let sprAni:CASpringAnimation = CASpringAnimation(keyPath: "bounds")
        // 弹簧质量,影响惯性
        sprAni.mass = 10
        // 刚度系数,数值越大,产生形变的力越大,运动越快
        sprAni.stiffness = 5000
        // 阻尼系数,越大停止越快
        sprAni.damping = 100
        // 初始速度
        sprAni.initialVelocity = 10
        sprAni.duration = sprAni.settlingDuration
        sprAni.toValue = NSValue.init(CGRect: CGRectMake(0, 0, 400, 400))
        // 组合动画
        let group:CAAnimationGroup = CAAnimationGroup()
        group.animations = [ani, sprAni]
        group.duration = 0.5
        group.removedOnCompletion = false
        group.fillMode = kCAFillModeForwards
        group.delegate = self
        self.testView.layer.addAnimation(group, forKey: nil)
        
    }
    
    // MARK: - 代理方法
    override func animationDidStart(anim: CAAnimation) {
        print("动画开始")
    }
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("动画结束")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
            Int64(3.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
                self.testView.layer.removeAllAnimations()
                print("删除动画")
        }
    }

    
    // MARK: - system
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

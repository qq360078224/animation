//
//  BaseAnimationVC.swift
//  animation
//
//  Created by XQ on 16/7/4.
//  Copyright © 2016年 XQ. All rights reserved.
//

import UIKit

class BaseAnimationVC: UIViewController {
    // MARK: - 声明属性
    // 屏幕高度
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.height
    // 屏幕宽度
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
    // 按钮的背景view
    let btnBG = UIView()
    // 按钮文字数组
    let btnNames = ["position", "positionY", "rotationX", "rotationY", "rotationZ", "scale", "translation", "size", "opacity", "cornerRadius", "borderWidth", "contents"]
    // 用来测试的view
    let testView = UIImageView()
    // layer
   
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        self.initView()
        self.initBtns()
       

    }
    func initView() {
        btnBG.frame = CGRectMake(0, 20, SCREEN_WIDTH, 200)
        btnBG.backgroundColor = UIColor.greenColor()
        self.view.addSubview(btnBG)
        
        testView.frame = CGRectMake(100, 320, 150, 150)
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
            position()
        case 1:
            positionY()
        case 2:
            rotationX()
        case 3:
            rotationY()
        case 4:
            rotationZ()
        case 5:
            scale()
        case 6:
            translation()
        case 7:
            size()
        case 8:
            opacity()
        case 9:
            cornerRadius()
        case 10:
            borderWidth()
        case 11:
            contents()
        default:break
            
        }
    }
    //对应的动画
    func position() {
        let ani = CABasicAnimation(keyPath: "position")
        ani.toValue = NSValue(CGPoint: CGPointMake(300, 300))
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.delegate = self
        ani.removedOnCompletion = false;
        ani.fillMode = kCAFillModeForwards;
        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func positionY() {
        let ani = CABasicAnimation(keyPath: "position.y")
        //  移动position到 y = 0
        ani.toValue = 0
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.delegate = self
        ani.removedOnCompletion = false;
        ani.fillMode = kCAFillModeForwards;
        self.testView.layer.addAnimation(ani, forKey: nil)
        
    }
    func rotationX() {
        let ani = CABasicAnimation(keyPath: "transform.rotation.x")
        ani.toValue = NSNumber.init(double: M_PI)
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.delegate = self
        ani.removedOnCompletion = false;
        ani.fillMode = kCAFillModeForwards;
        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func rotationY() {
        let ani = CABasicAnimation(keyPath: "transform.rotation.y")
        ani.toValue = NSNumber.init(double: M_PI)
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.delegate = self
        ani.removedOnCompletion = false;
        ani.fillMode = kCAFillModeForwards;
        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func rotationZ() {
        let ani = CABasicAnimation(keyPath: "transform.rotation.z")
        ani.toValue = NSNumber.init(double: M_PI_2)
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.delegate = self
        ani.removedOnCompletion = false;
        ani.fillMode = kCAFillModeForwards;
        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func scale() {
        let ani = CABasicAnimation(keyPath: "transform.scale")
        
        ani.toValue = NSNumber(int: 2)
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.delegate = self
        ani.removedOnCompletion = false;
        ani.fillMode = kCAFillModeForwards;
        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func translation() {
        let ani = CABasicAnimation(keyPath: "transform.translation")
        
        ani.toValue = NSValue(CGPoint: CGPointMake(-50, -50))
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.delegate = self
        ani.removedOnCompletion = false;
        ani.fillMode = kCAFillModeForwards;
        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func size() {
//        let ani = CABasicAnimation(keyPath: "size")
//        
//        ani.toValue = NSValue(CGSize: CGSizeMake(500, 500))
//        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        ani.delegate = self
//        ani.removedOnCompletion = false;
//        ani.fillMode = kCAFillModeForwards;
//        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func opacity() {
        let ani = CABasicAnimation(keyPath: "opacity")

        ani.toValue = NSNumber.init(float: 0.3)
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.delegate = self
        ani.removedOnCompletion = false;
        ani.fillMode = kCAFillModeForwards;
        self.testView.layer.addAnimation(ani, forKey: nil)

    }
    func cornerRadius() {
        let ani = CABasicAnimation(keyPath: "cornerRadius")
        ani.toValue = NSNumber.init(float: 50)
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.delegate = self
        ani.removedOnCompletion = false;
        ani.fillMode = kCAFillModeForwards;
        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func borderWidth() {
        let ani = CABasicAnimation(keyPath: "borderWidth")
        
        ani.toValue = NSNumber.init(float: 2)
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.delegate = self
        ani.removedOnCompletion = false;
        ani.fillMode = kCAFillModeForwards;
        self.testView.layer.addAnimation(ani, forKey: nil)
    }
    func contents() {
        let ani = CABasicAnimation(keyPath: "contents")
        ani.toValue = UIImage.init(named: "12.png")?.CGImage
        ani.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        ani.delegate = self
        ani.removedOnCompletion = false;
        ani.fillMode = kCAFillModeForwards;
        self.testView.layer.addAnimation(ani, forKey: nil)
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

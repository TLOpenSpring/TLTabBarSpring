//
//  TLTabBarSpringController.swift
//  Pods
//
//  Created by Andrew on 16/5/28.
//
//

import UIKit

public class TLTabBarSpringController: UITabBarController {

    public var tlTabbar:UIView!
    
    public var topLine:UIView!
    
    var  menuCount:Int = 1
    
    //MARK: - 构造方法
    public init(viewControllers:[UIViewController]){
        super.init(nibName: nil, bundle: nil)
        self.setViewControllers(viewControllers, animated: false)
        
        var rect = CGRectMake(0, TLScreen_height-49, TLScreen_width, 49)
        tlTabbar = UIView(frame: rect)
        self.view.addSubview(tlTabbar)
        tlTabbar.backgroundColor = UIColor.clearColor()
        
        
        rect = CGRectMake(0, 0, TLScreen_width, 1)
        topLine = UIView(frame:rect)
        topLine.backgroundColor = UIColor.groupTableViewBackgroundColor()
        tlTabbar.addSubview(topLine)
        
        
        
        let containers = createContainers()
        self.creatCustomIcons(containers)
        
    }

    
   
   
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        
    }

    
    public override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    //MARK: - private method
    func creatCustomIcons(containers:NSDictionary) -> Void {
        
        guard let items = tabBar.items as? [TLTabBarSpringItem] else {
         fatalError("items 必须继承TLTabbarSpringItem")
        }
        
        var index = 0
        for item in items{
            guard let itemImage = item.image else {
                fatalError("请添加一个图标到UITabBarItem")
            }
            
            guard let container = containers["container\(index)"] as? UIView else {
                fatalError()
            }
            
            container.tag = index
            
            let tlTabBarItem = item as TLTabBarSpringItem
            
            let renderMode = CGColorGetAlpha(item.iconColor.CGColor) == 0 ? UIImageRenderingMode.AlwaysOriginal :
                UIImageRenderingMode.AlwaysTemplate
            
            
            let icon = UIImageView(image: item.image?.imageWithRenderingMode(renderMode))
            icon.tintColor = item.iconColor
            
            
            icon.frame=CGRectMake(container.frame.size.width/2-icon.frame.size.width/2, 5, icon.frame.size.width, icon.frame.size.height)
            container.addSubview(icon)
            
            //文本显示
            let textLb = UILabel()
            textLb.text = item.title
            textLb.textColor = item.textColor
            textLb.font=item.defaultFont
            textLb.textAlignment = .Center
            
            
            let textLabelWidth = tabBar.frame.size.width / CGFloat(items.count)-1
            textLb.frame=CGRectMake(0, container.frame.size.height-15, textLabelWidth, 15)
            
            container.addSubview(textLb)
            
            item.iconView = (icon:icon,textLb:textLb)
            
            if(index == 0){
                item.selectedState()
                container.backgroundColor = tlTabBarItem.selectBackgroundColor
            }
            
            item.image = nil
            item.title=nil
            index += 1
        
        }
    }
    
    
    //MARK: - 创建菜单容器
    func createContainers() -> NSDictionary {
        guard let items = tabBar.items else {
          fatalError("请至少添加一个item在TabBar中")
        }
        
        menuCount = items.count
        //声明一个字典
        var containerDict = [String: AnyObject]()
        
        var originX:CGFloat = 0
        for index in 0..<items.count {
            let container:UIView = createViewContainer(originX)
            containerDict["container\(index)"] = container
            originX = CGRectGetMaxX(container.frame)
        }
        return containerDict
        
    }
    
    /**
     创建每个菜单的容器
     
     - returns: UIView
     */
    func createViewContainer(originX:CGFloat) -> UIView {
        let container = UIView()
        
       
        container.frame=CGRectMake(originX, 0, TLScreen_width/CGFloat(menuCount), 50)
        tlTabbar.addSubview(container)
        
        //添加手势
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(menuTapHander(_:)))
        tapGesture.numberOfTapsRequired = 1
        container.addGestureRecognizer(tapGesture)
        
        return container
    }
    /**
     点击每个菜单响应方法
     
     - parameter gesture: 单击手势
     */
    func menuTapHander(gesture:UIGestureRecognizer) -> Void {
        
       // print("点击菜单了menuTapHander")
        guard let items = tabBar.items as? [TLTabBarSpringItem] else {
            fatalError("item必须继承TLTabBarSpringItem")
        }
        
        guard let gestureView = gesture.view else {
         return
        }
        
        let currentIndex = gestureView.tag
        
        //获取当前的控制器
        let controller = self.childViewControllers[currentIndex]
        
        if let shouldSelect = delegate?.tabBarController?(self, shouldSelectViewController: controller) where !shouldSelect{
          return
        }
        
        
        if selectedIndex != currentIndex {
            let animationItem:TLTabBarSpringItem = items[currentIndex]
            //#TODO Fixme
            animationItem.playAnimation()
            
            let deselectItem = items[selectedIndex]
            let containerPrev:UIView = deselectItem.iconView!.icon.superview!
             containerPrev.backgroundColor = items[currentIndex].DefaultBackgroundColor
            
            deselectItem.deSelectAnimation()
            
            let container:UIView = animationItem.iconView!.icon.superview!
            container.backgroundColor = items[currentIndex].selectBackgroundColor
            
            selectedIndex = gestureView.tag
            
            delegate?.tabBarController?(self, didSelectViewController: controller)
            
            
            
        }else if selectedIndex == currentIndex {
            if let navigatonVC = self.viewControllers![selectedIndex] as? UINavigationController{
             navigatonVC.popViewControllerAnimated(true)
            }
        }
    }
}
















//MARK: - 对TLTabBarSpringController扩展
 extension TLTabBarSpringController {

    public func changeSelectedColor(textselectedColor:UIColor,iconSelectedColor:UIColor){
     let items = tabBar.items as! [TLTabBarSpringItem]
        
        for index  in 0..<items.count {
         let item = items[index]
            
            item.animation.textSelctedColor = textselectedColor
            item.animation.iconSelectedColor = iconSelectedColor
            
            if item == self.tabBar.selectedItem {
             item.selectedState()
            }
        }
    }
    
    
    func setSelectIndex(from from: Int,to : Int) -> Void {
        selectedIndex = to
        
        guard let items = tabBar.items as? [TLTabBarSpringItem] else {
        fatalError("item必须继承TLTabBarSpringItem")
        }
        
        let containerFrom = items[from].iconView?.icon.superview
        containerFrom?.backgroundColor = items[from].DefaultBackgroundColor
        items[from].deSelectAnimation()
    
        
        let containerTo = items[to].iconView?.icon.superview
        containerTo?.backgroundColor = items[to].selectBackgroundColor
        items[to].selectedState()
        
    }
}











# TLTabBarSpring
<<<<<<< HEAD

[![CI Status](http://img.shields.io/travis/Andrew/TLTabBarSpring.svg?style=flat)](https://travis-ci.org/Andrew/TLTabBarSpring)
[![Version](https://img.shields.io/cocoapods/v/TLTabBarSpring.svg?style=flat)](http://cocoapods.org/pods/TLTabBarSpring)
[![License](https://img.shields.io/cocoapods/l/TLTabBarSpring.svg?style=flat)](http://cocoapods.org/pods/TLTabBarSpring)
[![Platform](https://img.shields.io/cocoapods/p/TLTabBarSpring.svg?style=flat)](http://cocoapods.org/pods/TLTabBarSpring)

## 示例
![1](http://7xsn4e.com1.z0.glb.clouddn.com/tabBar.gif)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## How to Use

首先要导入类库`import TLTabBarSpring`

有两种方式可以实现

## 手写代码实现


### 创建自定义的ViewController
在AppDelegate.swift中，在创爱一个自定义的ViewController

```
let vc1=CustomController1()
// #1 设置tabBarItem为类库中指定的
vc1.tabBarItem = TLTabBarSpringItem()
// #2 设置TLTabBarSpringItem的动画类型
(vc1.tabBarItem as! TLTabBarSpringItem).animation=TLBoundAnimation()
// #3 设置显示的标题
vc1.tabBarItem.title="首页"
// #4 设置图标
vc1.tabBarItem.image=UIImage(named: "icon_user")
// #5 设置默认和选中的样式
initStyle(vc1.tabBarItem)
```

### initStyle（）




>*注意:*
>
>设置的顺序不要乱，按照上述的顺序设置属性，以避免不必要的错误产生
>

### 创建TLTabBarSpringController

```
 let tabVc = TLTabBarSpringController(viewControllers: [vc1,vc2,vc3,vc4])
```

### 开启Window.RootController

```
self.window?.rootViewController=tabVc
self.window?.makeKeyAndVisible()
```

搞定！

## Storyboard实现


## 完整的代码

```
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
      
        manualCreateTabBar()
        return true
    }
    
    /**
     动画创建TabBarController
     */
    func manualCreateTabBar() -> Void {
        //1.创建Window
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        
        let vc1=CustomController1()
        // #1 设置tabBarItem为类库中指定的
        vc1.tabBarItem = TLTabBarSpringItem()
        // #2 设置TLTabBarSpringItem的动画类型
        (vc1.tabBarItem as! TLTabBarSpringItem).animation=TLBoundAnimation()
        // #3 设置显示的标题
        vc1.tabBarItem.title="首页"
        // #4 设置图标
        vc1.tabBarItem.image=UIImage(named: "icon_user")
        // #5 设置默认和选中的样式
        initStyle(vc1.tabBarItem)
        
        let vc2=CustomController2()
        vc2.tabBarItem = TLTabBarSpringItem()
         (vc2.tabBarItem as! TLTabBarSpringItem).animation=TLBoundAnimation()
        vc2.tabBarItem.title="发现"
        vc2.tabBarItem.image=UIImage(named: "icon_pin")
        initStyle(vc2.tabBarItem)
        
        let vc3=CustomController3()
        vc3.tabBarItem = TLTabBarSpringItem()
        (vc3.tabBarItem as! TLTabBarSpringItem).animation=TLBoundAnimation()
        vc3.tabBarItem.title="消息"
        vc3.tabBarItem.image=UIImage(named: "Tools_00028")
         initStyle(vc3.tabBarItem)
        
        let vc4=CustomController4()
        vc4.tabBarItem = TLTabBarSpringItem()
        (vc4.tabBarItem as! TLTabBarSpringItem).animation=TLBoundAnimation()
        vc4.tabBarItem.title="我的"
        vc4.tabBarItem.image=UIImage(named: "drop")
        initStyle(vc4.tabBarItem)
        
        
        
        let tabVc = TLTabBarSpringController(viewControllers: [vc1,vc2,vc3,vc4])

        
        tabVc.view.backgroundColor=UIColor.whiteColor()
        
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.rootViewController=tabVc
        self.window?.makeKeyAndVisible()
    }
    func initStyle(tabBarItem:UITabBarItem) -> Void {
        let tabBarSpringItem:TLTabBarSpringItem = tabBarItem as! TLTabBarSpringItem
        
        tabBarSpringItem.textColor = UIColor.grayColor()
        tabBarSpringItem.iconColor = UIColor.grayColor()
        
        tabBarSpringItem.animation.textSelctedColor=UIColor.redColor()
        tabBarSpringItem.animation.iconSelectedColor=UIColor.redColor()
        
    }

```




## Requirements

## Installation

TLTabBarSpring is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TLTabBarSpring"
```

## Author

Andrew, anluanlu123@163.com

## License

TLTabBarSpring is available under the MIT license. See the LICENSE file for more info.
=======
自定义的TabBar,支持动画
>>>>>>> 337342515af64b824ffb3a6299d66c08461a2e81

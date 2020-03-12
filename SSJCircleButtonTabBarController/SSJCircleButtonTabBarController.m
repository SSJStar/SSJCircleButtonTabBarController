//
//  SSJTabBarController.m
//  TaskNote
//
//  Created by 金汕汕 on 17/4/26.
//  Copyright © 2017年 ccs. All rights reserved.
//

#import "SSJCircleButtonTabBarController.h"
#import "SSJDownLoadManager.h"
#import "TNWelcomVC.h"
@implementation TabBarItemStyle
@end
@implementation TabBarStyle
@end

@interface SSJCircleButtonTabBarController ()<UITabBarControllerDelegate>

@end

@implementation SSJCircleButtonTabBarController

- (instancetype)initWithTabBarItems:(NSArray <TabBarItemStyle *>*)tabBarItemStyles tabBarStyle:(TabBarStyle *)tabBarStyle{
    self =  [super init];
    if (self) {
        /** 创建TabBarItems */
        [self createTabBarItems:tabBarItemStyles];
        
        //设置标签栏文字和图片的颜色
        if (tabBarStyle.tabBarTintColor) {
            self.tabBar.tintColor = tabBarStyle.tabBarTintColor;
        }
        
        //设置标签栏的颜色
        self.tabBar.barTintColor = tabBarStyle.tabBarBarTintColor;
        
        //设置标签栏风格(默认高度49)
        self.tabBar.barStyle = tabBarStyle.tabBarBarStyle;
        
        //设置初始状态选中的下标
        self.selectedIndex = tabBarStyle.tabSelectedIndex;
        /** 设置未选中和选中的颜色 */
        if (tabBarStyle.tabBarTintUnselectColor) {
            [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:tabBarStyle.tabBarTintUnselectColor} forState:UIControlStateNormal];
        }
        if (tabBarStyle.tabBarTintSelectedColor) {
            [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:tabBarStyle.tabBarTintSelectedColor} forState:UIControlStateSelected];
        }
    }
    return self;
}

- (void)creWithTabBarItems:(NSArray <TabBarItemStyle *>*)tabBarItemStyles tabBarStyle:(TabBarStyle *)tabBarStyle{
    self.delegate = self;
    /** 创建TabBarItems */
    [self createTabBarItems:tabBarItemStyles];
    
    //设置标签栏文字和图片的颜色
    if (tabBarStyle.tabBarTintColor) {
        self.tabBar.tintColor = tabBarStyle.tabBarTintColor;
    }
    
    //设置标签栏的颜色
    self.tabBar.barTintColor = tabBarStyle.tabBarBarTintColor;
    
    //设置标签栏风格(默认高度49)
    self.tabBar.barStyle = tabBarStyle.tabBarBarStyle;
    
    //设置初始状态选中的下标
    self.selectedIndex = tabBarStyle.tabSelectedIndex;
    /** 设置未选中和选中的颜色 */
    if (tabBarStyle.tabBarTintUnselectColor) {
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:tabBarStyle.tabBarTintUnselectColor} forState:UIControlStateNormal];
    }
    if (tabBarStyle.tabBarTintSelectedColor) {
        [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:tabBarStyle.tabBarTintSelectedColor} forState:UIControlStateSelected];
    }
}


- (void)createTabBarItems:(NSArray <TabBarItemStyle *>*)tabBarItemStyles{
    NSMutableArray *array = [NSMutableArray new];
    for (TabBarItemStyle*style in tabBarItemStyles) {
        UIViewController *contr = [NSClassFromString(style.controllerName) new];
        /**< 设置了无效 */
        /**< 
            contr.navigationItem.title = style.tabBarNavigationItemTitle;
            contr.tabBarItem.title = style.tabBarItemTitle;
         */
        if (style.tabBarItemImage) {
            contr.tabBarItem.image = style.tabBarItemImage;
        }
        contr.title = style.tabBarItemTitle;
        if (style.nav) {
            UINavigationController *firstNC = [[UINavigationController alloc]initWithRootViewController:contr];
            firstNC.navigationBar.translucent = NO;
            [array addObject:firstNC];
        }else{
            [array addObject:contr];
        }
        
        
    }
    self.viewControllers = array;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
}

@end

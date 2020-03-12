//
//  SSJTabBarController.h
//  TaskNote
//
//  Created by 金汕汕 on 17/4/26.
//  Copyright © 2017年 ccs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyUITabBarController.h"

@interface TabBarItemStyle : NSObject
/** UIController名 */
@property (nonatomic,strong) NSString *controllerName;

@property (nonatomic,assign) BOOL nav;//是否需要设置导航


/** 导航栏名 */
@property (nonatomic,strong) NSString *tabBarItemTitle;

/** 导航栏名名 */
@property (nonatomic,strong) NSString *tabBarNavigationItemTitle;

/** tabBarItem图片 */
@property (nonatomic,strong) UIImage *tabBarItemImage;

@end


@interface TabBarStyle : NSObject
/** tabBarTintColor /tabBarTintUnselectColor tabBarTintSelectedColor  二选一 */
/** 设置标签栏文字默认选中颜色 */
@property (nonatomic,strong) UIColor *tabBarTintColor;

/** 设置标签栏文字和图片的 未选中颜色 */
@property (nonatomic,strong) UIColor *tabBarTintUnselectColor;

/** 设置标签栏文字和图片的 选中颜色 */
@property (nonatomic,strong) UIColor *tabBarTintSelectedColor;

/** 设置标签栏背景的颜色 */
@property (nonatomic,strong) UIColor *tabBarBarTintColor;

/** 设置标签栏风格(默认高度49) */
@property (nonatomic,assign) UIBarStyle tabBarBarStyle;

/** 设置初始状态选中的下标 */
@property (nonatomic,assign) NSInteger tabSelectedIndex;

@end

@interface SSJCircleButtonTabBarController : MyUITabBarController
- (instancetype)initWithTabBarItems:(NSArray <TabBarItemStyle *>*)tabBarItemStyles tabBarStyle:(TabBarStyle *)tabBarStyle;

- (void)creWithTabBarItems:(NSArray <TabBarItemStyle *>*)tabBarItemStyles tabBarStyle:(TabBarStyle *)tabBarStyle;
@end



/*** 使用案例 */

//- (TabBarStyle *)createTabBarStyle{
//    TabBarStyle *tabBarStyle = [TabBarStyle new];
//    //设置标签栏文字和图片的颜色
//    //    tabBarStyle.tabBarTintColor = [UIColor whiteColor];
//    //设置标签栏背景的颜色
//    tabBarStyle.tabBarBarTintColor = [UIColor whiteColor];
//    //设置标签栏风格(默认高度49)
//    tabBarStyle.tabBarBarStyle = UIBarStyleBlack;
//    //设置初始状态选中的下标
//    tabBarStyle.tabSelectedIndex = 0;
//    /** 设置标签栏文字和图片的 未选中颜色 */
//    tabBarStyle.tabBarTintUnselectColor = [UIColor grayColor];
//    /** 设置标签栏文字和图片的 选中颜色 */
//    tabBarStyle.tabBarTintSelectedColor = [UIColor redColor];
//    return tabBarStyle;
//}
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    // Override point for customization after application launch.
//    TabBarItemStyle *style2 = [TabBarItemStyle new];
//    style2.controllerName = @"TabViewController1";
//    style2.tabBarItemTitle = @"创建日志";
//    style2.tabBarNavigationItemTitle = @"创建日志";
//    style2.tabBarItemImage = [UIImage imageNamed:@"pen"];
//    style2.nav = YES;
//    
//    TabBarItemStyle *style3 = [TabBarItemStyle new];
//    style3.controllerName = @"TabViewController2";
//    style3.tabBarItemTitle = @"完成进度";
//    style3.tabBarNavigationItemTitle = @"完成进度";
//    style3.tabBarItemImage = [UIImage imageNamed:@"finishedSchedule"];
//    
//    
//    SSJCircleButtonTabBarController *tabBarController = [[SSJCircleButtonTabBarController alloc]initWithTabBarItems:@[style2,style3] tabBarStyle:[self createTabBarStyle]];
//    tabBarController.roundButtonVC = [[RoundButtonViewController alloc] init];
//    self.window.rootViewController = tabBarController;
//    
//    
//    
//    return YES;
//}

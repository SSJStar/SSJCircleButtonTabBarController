//
//  MyUITabBarControllerConfig.h
//  CustomTarbarViewController
//
//  Created by 金汕汕 on 17/4/28.
//  Copyright © 2017年 ccs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyUITabBarControllerConfig : NSObject
/** 圆形按钮点击控制层的名字 */
@property (nonatomic,strong) NSString *roundButtonVCName;
@property (nonatomic,strong) NSString *roundButtonVCItemTitle;
+ (instancetype)shareMyUITabBarControllerConfig;
- (void)RoundButtonClickedWithVC:(UIViewController *)sender;
@end


static NSInteger const viewControllersCount = 3;//tabbar上按钮个数
static float const roundButtonWidth = 60;//tabbar上 圆形按钮  宽度
static float const roundButtonHeight = 60;//tabbar上 圆形按钮  高度
static NSString *const createLogoImageName = @"typeOfAdd";//中间圆圈的图片

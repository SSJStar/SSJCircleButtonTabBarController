//
//  MyUITabBar.h
//  CustomTarbarViewController
//
//  Created by 金汕汕 on 17/4/28.
//  Copyright © 2017年 ccs. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RoundButtonDelegate <NSObject>
@optional
/** 点击动作 */
- (void)RoundButtonClicked;

@end

@interface MyUITabBar : UITabBar<RoundButtonDelegate>

@property (nonatomic, weak) id <RoundButtonDelegate>myDelegate;

@property (nonatomic, strong)UIButton *roundButton;

@end

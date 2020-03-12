//
//  MyUITabBar.m
//  CustomTarbarViewController
//
//  Created by 金汕汕 on 17/4/28.
//  Copyright © 2017年 ccs. All rights reserved.
//

#import "MyUITabBar.h"
#import "MyUITabBarControllerConfig.h"

@implementation MyUITabBar


- (instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.roundButton.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        [self.roundButton setBackgroundImage:[UIImage imageNamed:createLogoImageName ] forState:UIControlStateNormal];
        [self.roundButton addTarget:self action:@selector(roundBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.roundButton];
    }
    return self;
}

//懒加载
- (UIButton *)roundButton
{
    if (!_roundButton) {
        _roundButton = [[UIButton alloc] init];
    }
    return _roundButton;
}

- (void)roundBtnClicked{
    if ([self.myDelegate respondsToSelector:@selector(RoundButtonClicked)]) {
        [self.myDelegate RoundButtonClicked];
    }
}
/** 修改tabbarItem的位置和宽度 为中间按钮留出空位 */
- (void)layoutSubviews{
    int centerx = self.bounds.size.width * 0.5;
    int centery = self.bounds.size.height * 0.5;
    self.roundButton.frame = CGRectMake(centerx - (roundButtonWidth/2), centery - (roundButtonHeight-10), roundButtonWidth, roundButtonHeight);
    
    Class class = NSClassFromString(@"UITabBarButton");
    int index = 0;
    int tabWidth = self.bounds.size.width / viewControllersCount;//获得每一个tabbarItem的宽度
    
    for (UIView *view in self.subviews) {
        //找到UITabBarButton类型子控件,并修改它的x和width
        if ([view isKindOfClass:class]) {
            CGRect rect = view.frame;
            rect.origin.x = index * tabWidth;
            rect.size.width = tabWidth;
            view.frame = rect;
            index++;
            //留出位置放置中间凸出按钮
            NSInteger middle = (viewControllersCount - 1 )/ 2;
            
            if (index == middle) {
                index++;
            }
            
        }
    }
}

//响应触摸事件，如果触摸位置位于圆形按钮控件上，则由圆形按钮处理触摸消息
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    //判断tabbar是否隐藏
    if (self.hidden == NO) {
        if ([self touchPointInsideCircle:self.roundButton.center radius:30 targetPoint:point]) {
            //如果位于圆形按钮上，则由圆形按钮处理触摸消息
            return self.roundButton;
        }
        else{
            //否则系统默认处理
            return [super hitTest:point withEvent:event];
        }
    }
    return [super hitTest:point withEvent:event];
}

- (BOOL)touchPointInsideCircle:(CGPoint)center radius:(CGFloat)radius targetPoint:(CGPoint)point
{
    CGFloat dist = sqrtf((point.x - center.x) * (point.x - center.x) +
                         (point.y - center.y) * (point.y - center.y));
    return (dist <= radius);
}

@end

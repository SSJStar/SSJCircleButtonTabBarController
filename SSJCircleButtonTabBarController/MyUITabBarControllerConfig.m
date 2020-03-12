//
//  MyUITabBarControllerConfig.m
//  CustomTarbarViewController
//
//  Created by 金汕汕 on 17/4/28.
//  Copyright © 2017年 ccs. All rights reserved.
//

#import "MyUITabBarControllerConfig.h"
#import "SSJAnimateView.h"
#import "MyUITabBar.h"
#import "TaskNoteStatisticsVC.h"

@interface MyUITabBarControllerConfig()
@property (nonatomic,strong) SSJAnimateView *animateView;
@end
@implementation MyUITabBarControllerConfig
+ (instancetype)shareMyUITabBarControllerConfig{
    static MyUITabBarControllerConfig *config;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        config = [MyUITabBarControllerConfig new];
        config.roundButtonVCName = @"TaskNoteCreateVC";
        config.roundButtonVCItemTitle = @"创建日志";
    });
    return config;
}

- (void)RoundButtonClickedWithVC:(UIViewController *)sender{
    
    if (self.animateView.hidden) {
        
        self.animateView.hidden = NO;
        self.animateView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44);
        self.animateView .backgroundColor = [UIColor colorWithRed:250.0/255.0 green:250.0/255.0 blue:250.0/255.0 alpha:0.95];
        [sender.view addSubview:self.animateView];
        
        for (UIView *childView in sender.view.subviews) {
            if ([childView isKindOfClass:[MyUITabBar class]]) {
                [sender.view insertSubview:self.animateView belowSubview:childView];
            }
        }
        
        NSArray *imgArray = @[@"cow",@"black-cat",@"bulldog",@"crab",@"cat",@"chicken"];
        NSArray *titleArray = @[@"新增",@"查询"];
        
        [self.animateView createView:5 childViewHeight:50 imageNames:imgArray titles:titleArray webImage:NO bottomCancel:NO block:^(NSInteger index){
            NSLog(@"点击了%ld",(long)index);
            switch (index) {
                case 0:
                {
                    NSString *vcName = [MyUITabBarControllerConfig shareMyUITabBarControllerConfig].roundButtonVCName;
                    NSString *vcNavItemTitle = [MyUITabBarControllerConfig shareMyUITabBarControllerConfig].roundButtonVCItemTitle;
                    UIViewController *contr = [NSClassFromString(vcName) new];
                    contr.navigationItem.title = vcNavItemTitle;
                    //    contr.view.backgroundColor = [UIColor blueColor];
                    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:contr];
                    navVc.navigationBar.translucent = NO;
                    [sender presentViewController:navVc animated:YES completion:nil];
                }
                    break;
                case 1:{
                    NSString *vcNavItemTitle = [MyUITabBarControllerConfig shareMyUITabBarControllerConfig].roundButtonVCItemTitle;
                    TaskNoteStatisticsVC *vc = [TaskNoteStatisticsVC new];
                    
                    NSString *navTitleStr = [[vcNavItemTitle substringFromIndex:2] stringByAppendingString:@"查询"];
                    vc.navTitle = navTitleStr;
                    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:vc];
                    navVc.navigationBar.translucent = NO;
                    [sender presentViewController:navVc animated:YES completion:nil];
                }
                default:
                    break;
            }
            
            self.animateView.hidden = YES;
            [self.animateView removeBtnAction];
            
        }];
    }else{
        self.animateView.hidden = YES;
        [self.animateView removeBtnAction];
    }
    
}

- (SSJAnimateView *)animateView{
    if (!_animateView) {
        _animateView = [SSJAnimateView new];
        _animateView.hidden = YES;
    }
    return _animateView;
}
@end

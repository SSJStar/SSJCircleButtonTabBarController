//
//  MyUITabBarController.m
//  CustomTarbarViewController
//
//  Created by 金汕汕 on 17/4/28.
//  Copyright © 2017年 ccs. All rights reserved.
//

#import "MyUITabBar.h"
#import "MyUITabBarController.h"
#import "MyUITabBarControllerConfig.h"
#import "SSJAnimateView.h"

@interface MyUITabBarController ()<RoundButtonDelegate>
@property (nonatomic,strong) SSJAnimateView *animateView;
@end

@implementation MyUITabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyUITabBar *tabbar = [[MyUITabBar alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    tabbar.myDelegate = self;
    //修改系统的Tabbar，使用我们自定义的Tabbar
    [self setValue:tabbar forKeyPath:@"tabBar"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)RoundButtonClicked
{
    [[MyUITabBarControllerConfig shareMyUITabBarControllerConfig] RoundButtonClickedWithVC:self];
//    NSString *vcName = [MyUITabBarControllerConfig shareMyUITabBarControllerConfig].roundButtonVCName;
//    NSString *vcNavItemTitle = [MyUITabBarControllerConfig shareMyUITabBarControllerConfig].roundButtonVCItemTitle;
//    UIViewController *contr = [NSClassFromString(vcName) new];
//    contr.navigationItem.title = vcNavItemTitle;
////    contr.view.backgroundColor = [UIColor blueColor];
//    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:contr];
//    navVc.navigationBar.translucent = NO;
//    [self presentViewController:navVc animated:YES completion:nil];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end

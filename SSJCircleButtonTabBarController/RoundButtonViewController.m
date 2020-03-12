//
//  RoundButtonViewController.m
//  CustomTarbarViewController
//
//  Created by 金汕汕 on 17/4/28.
//  Copyright © 2017年 ccs. All rights reserved.
//

#import "RoundButtonViewController.h"

#import "UIBarButtonItem+category.h"
@interface RoundButtonViewController ()

@end

@implementation RoundButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blueColor]];
    
    [self setUpNav];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setUpNav
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithSender:self title:@"DissMiss" methodName:@"pop" titleSize:14.0f];
    self.navigationItem.title = @"新建";
    
}

- (void)pop
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

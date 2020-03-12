# SSJCircleButtonTabBarController
TabBarController中间是一个圆形按钮
# 使用方法：
- (TabBarStyle *)createTabBarStyle{
    TabBarStyle *tabBarStyle = [TabBarStyle new];
    //设置标签栏文字和图片的颜色
//    tabBarStyle.tabBarTintColor = [UIColor whiteColor];
    //设置标签栏背景的颜色
    tabBarStyle.tabBarBarTintColor = [UIColor whiteColor];
    //设置标签栏风格(默认高度49)
    tabBarStyle.tabBarBarStyle = UIBarStyleBlack;
    //设置初始状态选中的下标
    tabBarStyle.tabSelectedIndex = 0;
    /** 设置标签栏文字和图片的 未选中颜色 */
    tabBarStyle.tabBarTintUnselectColor = [UIColor grayColor];
    /** 设置标签栏文字和图片的 选中颜色 */
    tabBarStyle.tabBarTintSelectedColor = [UIColor colorWithHexString:@"e178fp"];
    return tabBarStyle;
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    /**< 初始化本地登录信息 赋值给单例SSJLoginSingle */
    [[SSJLoginSingle shareSSJLoginSingle] pAssignmentToLocalData];
    
    SSJCircleButtonTabBarController *tabBarController = [SSJCircleButtonTabBarController new];
    tabBarController.roundButtonVCName = @"TaskNoteCreateVC";
    tabBarController.roundButtonVCItemTitle = @"创建日志";
    //读取json文件
    NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath];
    NSString *path=[mainBundleDirectory stringByAppendingPathComponent:@".json文件名"];
    NSURL *url=[NSURL fileURLWithPath:path];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//    NSLog(@"%@",jsonDic);
        NSMutableArray *arr = [NSMutableArray new];
        for (NSDictionary *tabBarItemStyleDic in jsonDic[@"structure"]) {
            TabBarItemStyle *style = [TabBarItemStyle new];
            style.controllerName = tabBarItemStyleDic[@"controllerName"];
            style.tabBarItemTitle = tabBarItemStyleDic[@"tabBarItemTitle"];
            style.tabBarNavigationItemTitle = tabBarItemStyleDic[@"tabBarNavigationItemTitle"];
            style.tabBarItemImage = [UIImage imageNamed:tabBarItemStyleDic[@"tabBarItemImage"]];
            style.nav = [tabBarItemStyleDic[@"nav"] integerValue];
            [arr addObject:style];
        }
    self.window.rootViewController = tabBarController;//切换rootViewController
    return YES;
}




# 说明
tabbarController 中间的按钮点击事件由MyUITabBarControllerConfig来处理

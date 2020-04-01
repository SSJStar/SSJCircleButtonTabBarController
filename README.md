# SSJCircleButtonTabBarController
TabBarController中间是一个圆形按钮 </br>
# 使用方法： </br>
- (TabBarStyle *)createTabBarStyle{ </br>
    TabBarStyle *tabBarStyle = [TabBarStyle new]; </br>
    //设置标签栏文字和图片的颜色 </br>
//    tabBarStyle.tabBarTintColor = [UIColor whiteColor]; </br>
    //设置标签栏背景的颜色 </br>
    tabBarStyle.tabBarBarTintColor = [UIColor whiteColor]; </br>
    //设置标签栏风格(默认高度49) </br>
    tabBarStyle.tabBarBarStyle = UIBarStyleBlack; </br>
    //设置初始状态选中的下标 </br>
    tabBarStyle.tabSelectedIndex = 0; </br>
    /** 设置标签栏文字和图片的 未选中颜色 */ </br>
    tabBarStyle.tabBarTintUnselectColor = [UIColor grayColor]; </br>
    /** 设置标签栏文字和图片的 选中颜色 */ </br>
    tabBarStyle.tabBarTintSelectedColor = [UIColor colorWithHexString:@"e178fp"]; </br>
    return tabBarStyle; </br>
} </br>



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions { </br>
    /**< 初始化本地登录信息 赋值给单例SSJLoginSingle */ </br>
    [[SSJLoginSingle shareSSJLoginSingle] pAssignmentToLocalData]; </br> </br>
    
    SSJCircleButtonTabBarController *tabBarController = [SSJCircleButtonTabBarController new]; </br>
    tabBarController.roundButtonVCName = @"TaskNoteCreateVC"; </br>
    tabBarController.roundButtonVCItemTitle = @"创建日志"; </br>
    //读取json文件 </br>
    NSString *mainBundleDirectory=[[NSBundle mainBundle] bundlePath]; </br>
    NSString *path=[mainBundleDirectory stringByAppendingPathComponent:@".json文件名"]; </br>
    NSURL *url=[NSURL fileURLWithPath:path]; </br>
    NSData *data = [[NSData alloc] initWithContentsOfURL:url]; </br>
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil]; </br>
//    NSLog(@"%@",jsonDic); </br>
        NSMutableArray *arr = [NSMutableArray new]; </br>
        for (NSDictionary *tabBarItemStyleDic in jsonDic[@"structure"]) { </br>
            TabBarItemStyle *style = [TabBarItemStyle new]; </br>
            style.controllerName = tabBarItemStyleDic[@"controllerName"]; </br>
            style.tabBarItemTitle = tabBarItemStyleDic[@"tabBarItemTitle"]; </br>
            style.tabBarNavigationItemTitle = tabBarItemStyleDic[@"tabBarNavigationItemTitle"]; </br>
            style.tabBarItemImage = [UIImage imageNamed:tabBarItemStyleDic[@"tabBarItemImage"]]; </br>
            style.nav = [tabBarItemStyleDic[@"nav"] integerValue]; </br>
            [arr addObject:style]; </br>
        } </br>
    self.window.rootViewController = tabBarController;//切换rootViewController </br>
    return YES; </br>
} </br>




# 说明 </br>
tabbarController 中间的按钮点击事件由MyUITabBarControllerConfig来处理 </br>

//
//  LLBuyRouter.m
//  Pods
//
//  Created by Lilong on 2017/6/25.
//
//

#import "LLGBRouter.h"
#import "LLUtility.h"

#import "LLGBGameBeginViewController.h"  //开始
#import "LLGBGameIntroduceViewController.h"  //游戏介绍
#import "LLGBGameSettingViewController.h"   //游戏设置
#import "LLGBHumanVSComputerViewController.h"  //人机对战
#import "LLGBHumanVSHumanBySameScreenViewController.h"  //人人对战-同屏
#import "LLGBHumanVSHumanByBluetoothViewController.h"   //人人对战-蓝牙
@interface LLGBModuleInfo : NSObject
@property (nonatomic,strong) NSString *moduleName; //模块名称
@property (nonatomic,strong) NSString *page; //跳转的页面
@property (nonatomic,strong) id anObject; //对象参数
@property (nonatomic,strong) NSDictionary *parameter; //参数字典
@end

@implementation LLGBModuleInfo

- (instancetype)initWithURL:(NSURL *)url
{
    self = [super init];
    if (self) {
        self.moduleName = url.host;
        self.page = url.path;
        NSString *query = url.query;
        if (query) {
            NSMutableDictionary *param = [@{}mutableCopy];
            NSURLComponents *urlc = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
            NSArray *parameterArray = urlc.queryItems;
            for (NSURLQueryItem *queryItem in parameterArray) {
                [param setObject:queryItem.value forKey:queryItem.name];
            }
            self.parameter = param;
        }
    }
    return self;
}
@end


@implementation LLGBRouter

+ (LLGBRouter *)routeWithUrl:(NSURL *)url CurrentViewC:(UIViewController *) currentViewCtrller hidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed object:(id)anobject{
    LLGBRouter *route = [[LLGBRouter alloc] initWithUrl:url CurrentViewC:currentViewCtrller hidesBottomBarWhenPushed:hidesBottomBarWhenPushed object:anobject ];
    return route;
}

- (id)initWithUrl:(NSURL *)url CurrentViewC:(UIViewController *) currentViewCtrller hidesBottomBarWhenPushed:(BOOL)yes object:(id)anobject{
    self = [super init];
    if (self) {
        self.viewCtrller = currentViewCtrller;
        self.linkUrl = url;
        self.hidesBottom = yes;
        self.anObject = anobject;
        [self startParsingWithUrl:url];
    }
    return self;
}

-(LLGBModuleInfo *)getModuleInfo:(NSURL *)url{
    return  [[LLGBModuleInfo alloc] initWithURL:url];
}

#pragma mark - 开始解析
/**
 *  开始解析
 *
 *  @param url url description
 */
-(void)startParsingWithUrl:(NSURL *)url{
    NSString *scheme = url.scheme;
    if ([scheme hasPrefix:LLGB_SCHEME]) {
        [self routeToModule:[self getModuleInfo:url]];
    }else if ([scheme isEqualToString:@"http"]||[scheme isEqualToString:@"https"]||[scheme isEqualToString:@"ftp"])
    {
        [self parseToOtherLinkWithUrl:url.absoluteString];
    }else if ([scheme isEqualToString:@"tel"])
    {
        [self parseToPhoneCallWithUrl:url.absoluteString];
    }else
    {
        [LLUtility showAlertWithTitle:@"链接地址错误" message:url.absoluteString leftButtonTitle:@"关闭" rightButtonTitle:nil leftButtonBlock:nil rightButtonBlock:nil];
    }
}

#pragma mark - 解析到对应的模块
/**
 *  解析模块  (内部)
 *
 *  @param moduleInfo url description
 */
-(void)routeToModule:(LLGBModuleInfo*)moduleInfo{
    if ([moduleInfo.moduleName isEqualToString:@"game"]) {
        //
        [self routeToGameWithModule:moduleInfo];
    }

}
/**
 *  解析为外部链接
 *
 *  @param url url description
 */
-(void)parseToOtherLinkWithUrl:(NSString*)url{
    
}

/**
 *  拨打电话
 *
 *  @param url url description
 */
-(void)parseToPhoneCallWithUrl:(NSString*)url{
     UIWebView*callWebview =[[UIWebView alloc] init] ;
     NSURL *telURL =[NSURL URLWithString:url];
     [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
     [self.viewCtrller.view addSubview:callWebview];
}


- (void)routeToGameWithModule:(LLGBModuleInfo*)moduleInfo{
    //开始
    if ([moduleInfo.page isEqualToString:@"/begin"]) {
        [LLGBRouter pushToGameBeginWithCurrVC:self.viewCtrller];
        return;
    }
    //人机对战
    if ([moduleInfo.page isEqualToString:@"/human_vs_computer"]) {
        [LLGBRouter pushToHumanVSConputerWithCurrVC:self.viewCtrller];
        return;
    }
    //同屏对战
    if ([moduleInfo.page isEqualToString:@"/human_vs_human_by_samescreen"]) {
        [LLGBRouter pushToHumanVSHumanBySameScreenWithCurrVC:self.viewCtrller];
        return;
    }
    ///蓝牙对战
    if ([moduleInfo.page isEqualToString:@"/human_vs_human_by_bluetooth"]) {
        [LLGBRouter pushToHumanVSHumanByBluetoothWithCurrVC:self.viewCtrller];
        return;
    }
    //游戏介绍
    if ([moduleInfo.page isEqualToString:@"/introduce"]) {
        [LLGBRouter pushToGameIntroduceWithCurrVC:self.viewCtrller];
        return;
    }
    //游戏设置
    if ([moduleInfo.page isEqualToString:@"/setting"]) {
        [LLGBRouter pushToGameSettingWithCurrVC:self.viewCtrller];
        return;
    }
    
}

//开始
+ (void)pushToGameBeginWithCurrVC:(UIViewController *)currVC{
    LLGBGameBeginViewController *vc = [[LLGBGameBeginViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}

//游戏介绍
+ (void)pushToGameIntroduceWithCurrVC:(UIViewController *)currVC{
    LLGBGameIntroduceViewController *vc = [[LLGBGameIntroduceViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}

//游戏设置
+ (void)pushToGameSettingWithCurrVC:(UIViewController *)currVC{
    LLGBGameSettingViewController *vc = [[LLGBGameSettingViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}
//人机对战
+ (void)pushToHumanVSConputerWithCurrVC:(UIViewController *)currVC{
    LLGBHumanVSComputerViewController *vc = [[LLGBHumanVSComputerViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}
//蓝牙对战
+ (void)pushToHumanVSHumanByBluetoothWithCurrVC:(UIViewController *)currVC{
    LLGBHumanVSHumanByBluetoothViewController *vc = [[LLGBHumanVSHumanByBluetoothViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}
//同屏对战
+ (void)pushToHumanVSHumanBySameScreenWithCurrVC:(UIViewController *)currVC{
    LLGBHumanVSHumanBySameScreenViewController *vc = [[LLGBHumanVSHumanBySameScreenViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [currVC.navigationController pushViewController:vc animated:YES];
}










@end

//
//  LLGBRouter.h
//  Pods
//
//  Created by Lilong on 2017/6/25.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define LLGB_SCHEME @"llgb"
//开始页面
static NSString *const llgb_routeWithBegin = @"llgb://game/begin";
//人机对战
static NSString *const llgb_routeWithHumanVSComputer = @"llgb://game/human_vs_computer";
//同屏对战
static NSString *const llgb_routeWithHumanVSHumanBySameScreen = @"llgb://game/human_vs_human_by_samescreen";
//蓝牙对战
static NSString *const llgb_routeWithHumanVSHumanByBluetooth = @"llgb://game/human_vs_human_by_bluetooth";
//游戏介绍
static NSString *const llgb_routeWithGameIntroduce = @"llgb://game/introduce";
//游戏设置
static NSString *const llgb_routeWithGameSetting = @"llgb://game/setting";

@interface LLGBRouter : NSObject
@property (nonatomic,strong) UIViewController *viewCtrller; //跳转的VC
@property (nonatomic,strong) NSURL *linkUrl; //链接地址
@property (nonatomic,assign) BOOL isPush; //是否跳转页面
@property (nonatomic,assign) BOOL hidesBottom; //是否跳转页面
@property (nonatomic,strong) id anObject; //参数


/**
 统一跳转

 @param url 路径url 内部和外部的url
 @param currentViewCtrller 当前页面
 @param hidesBottomBarWhenPushed hidesBottomBarWhenPushed
 @param anobject 传值
 @return 返回当前 对象
 */
+ (LLGBRouter *)routeWithUrl:(NSURL *)url CurrentViewC:(UIViewController *) currentViewCtrller hidesBottomBarWhenPushed:(BOOL)hidesBottomBarWhenPushed object:(id)anobject;


@end

//
//  LLGBGameBeginViewController.m
//  Pods
//
//  Created by Lilong on 2017/8/24.
//
//

#import "LLGBGameBeginViewController.h"
#import "LLGBRouter.h"
@interface LLGBGameBeginViewController ()

@end

@implementation LLGBGameBeginViewController

- (BOOL)fd_prefersNavigationBarHidden{
    return YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"五子棋";
    
    // Do any additional setup after loading the view from its nib.
}
//人机对战
- (IBAction)HumanVSComputerAction:(id)sender {
    [LLGBRouter routeWithUrl:[NSURL URLWithString:llgb_routeWithHumanVSComputer] CurrentViewC:self hidesBottomBarWhenPushed:YES object:nil];
}

//同屏对战
- (IBAction)humanVSHumanBySameScreenAction:(id)sender {
    [LLGBRouter routeWithUrl:[NSURL URLWithString:llgb_routeWithHumanVSHumanBySameScreen] CurrentViewC:self hidesBottomBarWhenPushed:YES object:nil];
}

//蓝牙对战
- (IBAction)humanVSHumanByBluetoothAction:(id)sender {
    [LLGBRouter routeWithUrl:[NSURL URLWithString:llgb_routeWithHumanVSHumanByBluetooth] CurrentViewC:self hidesBottomBarWhenPushed:YES object:nil];
}

//游戏介绍
- (IBAction)gameIntroduceAction:(id)sender {
    [LLGBRouter routeWithUrl:[NSURL URLWithString:llgb_routeWithGameIntroduce] CurrentViewC:self hidesBottomBarWhenPushed:YES object:nil];

}

//游戏设置
- (IBAction)gameSetting:(id)sender {
    [LLGBRouter routeWithUrl:[NSURL URLWithString:llgb_routeWithGameSetting] CurrentViewC:self hidesBottomBarWhenPushed:YES object:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//
//  LLGBGameSettingViewController.m
//  Pods
//
//  Created by Lilong on 2017/9/2.
//
//

#import "LLGBGameSettingViewController.h"
#import "LLSwitch.h"
@interface LLGBGameSettingViewController ()
//白旗先手
@property (unsafe_unretained, nonatomic) IBOutlet LLSwitch *whiteChessFristSwitch;
//玩家先手
@property (unsafe_unretained, nonatomic) IBOutlet LLSwitch *playerFristSwitch;
//声音开关
@property (unsafe_unretained, nonatomic) IBOutlet LLSwitch *voiceSwitch;


@end

@implementation LLGBGameSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"游戏设置";
    
    // Do any additional setup after loading the view from its nib.
}


- (void)didTapLLSwitch:(LLSwitch *)llSwitch {
    
    //    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //    LLSwitch *whiteSwith = [self.view viewWithTag:100];
    //    LLSwitch *AISwith = [self.view viewWithTag:101];
    //    if (llSwitch == whiteSwith) {
    //        [defaults setBool:YES forKey:IsWhiteSente];
    //    } else if (llSwitch == AISwith) {
    //        [defaults setBool:YES forKey:IsPlayerSente];
    //    } else {
    //        [defaults setBool:YES forKey:IsSounds];
    //    }
}


- (void)animationDidStopForLLSwitch:(LLSwitch *)llSwitch {
//    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    LLSwitch *whiteSwith = [self.view viewWithTag:100];
//    LLSwitch *AISwith = [self.view viewWithTag:101];
//    if (llSwitch == whiteSwith) {
//        [defaults setBool:llSwitch.on forKey:IsWhiteSente];
//    } else if (llSwitch == AISwith) {
//        [defaults setBool:llSwitch.on forKey:IsPlayerSente];
//    } else {
//        [defaults setBool:llSwitch.on forKey:IsSounds];
//    }
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

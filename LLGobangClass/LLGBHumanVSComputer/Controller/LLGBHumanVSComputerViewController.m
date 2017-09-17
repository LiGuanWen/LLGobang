//
//  LLGBHumanVSComputerViewController.m
//  Pods
//
//  Created by Lilong on 2017/9/17.
//
//

#import "LLGBHumanVSComputerViewController.h"

@interface LLGBHumanVSComputerViewController ()

@property (unsafe_unretained, nonatomic) IBOutlet UIButton *voiceButton;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *playAgainButton;
@property (unsafe_unretained, nonatomic) IBOutlet UIButton *undoButton;  //悔棋

@end

@implementation LLGBHumanVSComputerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"人机对战";
    // Do any additional setup after loading the view from its nib.
}
//声音设置
- (IBAction)setVoiceAction:(id)sender {
    self.voiceButton.selected = !self.voiceButton.selected;
    
}

//重来
- (IBAction)playAgainAction:(id)sender {
}
//悔棋
- (IBAction)UndoAction:(id)sender {
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

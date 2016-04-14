//
//  ViewController.m
//  UITextFieldDemo
//
//  Created by GuochengLiu on 16/4/14.
//  Copyright © 2016年 sumavision. All rights reserved.
//

#import "ViewController.h"
#import "CLGCommentInputViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onHitCommentButton:(UIButton *)sender {
    
    [CLGCommentInputViewController showInViewController:self title:@"写评论" sendTitle:@"发送" cancelTitle:@"取消" delegate:(id<CLGCommentInputViewControllerDelegate>)self];
}


#pragma mark - <CLGCommentInputViewControllerDelegate>

- (void)didClickSendButton:(UIViewController *)commentInputVC sendText:(NSString *)text
{
    //your sending process...
    
    NSLog(@"Send success");
    
    [commentInputVC dismissViewControllerAnimated:YES completion:nil];
    
}

@end

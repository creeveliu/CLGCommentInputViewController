//
//  TSCommentInputViewController.m
//  UITextFieldDemo
//
//  Created by GuochengLiu on 16/4/14.
//  Copyright © 2016年 sumavision. All rights reserved.
//

#import "CLGCommentInputViewController.h"

@interface CLGCommentInputViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textInputViewBottomOffset;

@end

@implementation CLGCommentInputViewController
{
    NSString *_title;
    NSString *_sendTitle;
    NSString *_cancelTitle;
}

- (instancetype)initWithTitle:(NSString *)title sendTitle:(NSString *)sendTitle cancelTitle:(NSString *)cancelTitle
{
    self = [self initWithNibName:@"CLGCommentInputViewController" bundle:nil];
    if (self) {
        _title = title;
        _sendTitle = sendTitle;
        _cancelTitle = cancelTitle;
    }
    return self;
}


+ (CLGCommentInputViewController *)showInViewController:(UIViewController *)viewController title:(NSString *)title sendTitle:(NSString *)sendTitle cancelTitle:(NSString *)cancelTitle delegate:(id<CLGCommentInputViewControllerDelegate>)delegate
{
    CLGCommentInputViewController *commentInputVC = [[CLGCommentInputViewController alloc] initWithTitle:title sendTitle:sendTitle cancelTitle:cancelTitle];
    commentInputVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    commentInputVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [viewController presentViewController:commentInputVC animated:YES completion:nil];
    
    [commentInputVC setDelegate:(id<CLGCommentInputViewControllerDelegate>)delegate];
    return commentInputVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.sendButton setEnabled:NO];
    [self.textView setDelegate:(id<UITextViewDelegate>)self];
    [self.textView becomeFirstResponder];
    
    
    [self.titleLabel setText:_title];
    [self.cancelButton setTitle:_cancelTitle forState:UIControlStateNormal];
    [self.sendButton setTitle:_sendTitle forState:UIControlStateNormal];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapBackgroundView:)];
    [self.view addGestureRecognizer:tapGR];
    
    [self.textInputView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:nil]];
}

- (void)onTapBackgroundView:(UITapGestureRecognizer *)tapGR
{
    [self onHitCancelButton:self.cancelButton];
}

- (void)keyboardWillShow:(NSNotification *)noti
{
    NSValue *value = [noti.userInfo valueForKey:@"UIKeyboardFrameEndUserInfoKey"];
    
    CGRect frame = value.CGRectValue;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.textInputViewBottomOffset.constant = frame.size.height;
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHide:(NSNotification *)noti
{
    [UIView animateWithDuration:0.4 animations:^{
        self.textInputViewBottomOffset.constant = 0;
        [self.view layoutIfNeeded];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onHitCancelButton:(UIButton *)sender {
    
    [UIView animateWithDuration:0.4 animations:^{
        self.textInputViewBottomOffset.constant = 0;
        [self.view layoutIfNeeded];
    }];
    
    [self.textView resignFirstResponder];
    
    [self dismissViewControllerAnimated:YES completion:^{
        if ([self.delegate respondsToSelector:@selector(didCancelInput)]) {
            [self.delegate didCancelInput];
        }
    }];
}

- (IBAction)onHitSendButton:(UIButton *)sender {
    [self.textView resignFirstResponder];
    
    if ([self.delegate respondsToSelector:@selector(didClickSendButton:sendText:)]) {
        [self.delegate didClickSendButton:self sendText:self.textView.text];
    }
}

#pragma mark - <UITextViewDelegate>

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        [self.sendButton setEnabled:NO];
    } else {
        [self.sendButton setEnabled:YES];
    }
}

- (void)setTitleColor:(UIColor *)titleColor cancelButtonColor:(UIColor *)cancelButtonColor sendButtonColor:(UIColor *)sendButtonColor textViewColor:(UIColor *)textViewColor
{
    if (titleColor != nil) {
        [self.titleLabel setTextColor:titleColor];
    }
    
    if (cancelButtonColor != nil) {
        [self.cancelButton setTitleColor:cancelButtonColor forState:UIControlStateNormal];
    }
    
    if (sendButtonColor != nil) {
        [self.sendButton setTitleColor:sendButtonColor forState:UIControlStateNormal];
    }
    
    if (textViewColor != nil) {
        [self.textView setTextColor:textViewColor];
    }
}

@end

//
//  TSCommentInputViewController.h
//  UITextFieldDemo
//
//  Created by GuochengLiu on 16/4/14.
//  Copyright © 2016年 sumavision. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CLGCommentInputViewController;

@protocol CLGCommentInputViewControllerDelegate <NSObject>

- (void)didCancelInput;

- (void)didClickSendButton:(CLGCommentInputViewController *)commentInputVC sendText:(NSString *)text;

@end

@interface CLGCommentInputViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *textInputView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) id<CLGCommentInputViewControllerDelegate> delegate;

- (instancetype)initWithTitle:(NSString *)title sendTitle:(NSString *)sendTitle cancelTitle:(NSString *)cancelTitle;

+ (CLGCommentInputViewController *)showInViewController:(UIViewController *)viewController title:(NSString *)title sendTitle:(NSString *)sendTitle cancelTitle:(NSString *)cancelTitle delegate:(id<CLGCommentInputViewControllerDelegate>)delegate;

- (void)setTitleColor:(UIColor *)titleColor cancelButtonColor:(UIColor *)cancelButtonColor sendButtonColor:(UIColor *)sendButtonColor textViewColor:(UIColor *)textViewColor;

@end

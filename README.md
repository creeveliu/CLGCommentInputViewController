# CLGCommentInputViewController

A comment  input view controller, easy to use

requirement iOS8.0 and above

![](https://github.com/creeveliu/CLGCommentInputViewController/blob/master/CommentInputDemo.gif)

## Install and Import


### Via CocoaPods(Recommended)

Add `pod 'CLGCommentInputViewController'` to your podfile and pod install

After pod installed, open yourproject.xcworkspace and

```
#import <CLGCommentInputViewController.h>
```

### Mannually 

Download repo, drag CLGCommentInputViewController folder to your project and 

```
#import "CLGCommentInputViewController.h"
```

## Usage

Just one line:

```
[CLGCommentInputViewController showInViewController:self title:@"Comment" sendTitle:@"Send" cancelTitle:@"Cancel" delegate:(id<CLGCommentInputViewControllerDelegate>)self];
```

And implement the CLGCommentInputViewControllerDelegate

```
- (void)didClickSendButton:(UIViewController *)commentInputVC sendText:(NSString *)text
{
    //your sending process...
    
    NSLog(@"Send success");
    [commentInputVC dismissViewControllerAnimated:YES completion:nil];
    
}
```
# CLGCommentInputViewController
A comment  input view controller, easy to use

![](https://github.com/creeveliu/CLGCommentInputViewController/blob/master/CommentInputDemo.gif)


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
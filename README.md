# KMCustomAlertView

Customizable UIAlertVIew subclass. Easily customize labels, buttons and background of a UIAlertView.

## How do I use it?

Easy as pie. Copy KMCustomAlertView.h and KMCustomAlertView.m into your project. Subclass KMCustomAlertView and overwrite the following methods:

```objective-c
- (UILabel *)titleLabel;
- (UILabel *)messageLabel;
- (UIButton *)cancelButton;
- (UIButton *)otherButton;
- (UIView *)backgroundView;
```

That's it. Don't worry about frames and all that, just provide desired labels/buttons/background view. Since it's a subclass of UIAlertView it can be used as such:

```objective-c
UIAlertView *alertView = [[MyAlertView alloc] initWithTitle:@"title string"
                                                    message:@"this is a message in landscape"
                                                   delegate:self
                                          cancelButtonTitle:@"cancel"
                                          otherButtonTitles:@"other 1", nil];
```

![Custom UIAlertView][preview1]

[preview1]: http://github.muncken.dk/kmcustomalertview/alert1.png "KMCustomAlertView"

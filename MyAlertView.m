//
//  MyAlertView.m
//  playing
//
//  Created by Kasper Munck on 12/8/12.
//  Copyright (c) 2012 KAPPS. All rights reserved.
//

#import "MyAlertView.h"

@implementation MyAlertView

- (UILabel *)titleLabel {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    return label;
}

- (UILabel *)messageLabel {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blueColor];
    return label;
}

- (UIButton *)cancelButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    return button;
}

- (UIButton *)otherButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor grayColor];
    return button;
}

- (UIView *)backgroundView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

@end

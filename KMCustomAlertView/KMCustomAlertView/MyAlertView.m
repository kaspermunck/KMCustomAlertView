//
//  MyAlertView.m
//  KMCustomAlertView
//
//  Created by Kasper Munck on 12/8/12.
//  Copyright (c) 2012 KAPPS. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MyAlertView.h"

@implementation MyAlertView

- (UILabel *)titleLabel {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}

- (UILabel *)messageLabel {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor blueColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue" size:30];
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}

- (UIButton *)cancelButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [self addBorderToView:button];
    
    return button;
}

- (UIButton *)otherButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor grayColor];
    [self addBorderToView:button];
    
    return button;
}

- (UIView *)backgroundView {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    [self addBorderToView:view];
    
    return view;
}

- (void)addBorderToView:(UIView *)view {
    view.layer.cornerRadius = 10.f;
    view.layer.borderWidth = 1.f;
    view.layer.borderColor = [UIColor grayColor].CGColor;
}

@end

//
//  KMAlertView.m
//  playing
//
//  Created by Kasper Munck on 12/6/12.
//  Copyright (c) 2012 KAPPS. All rights reserved.
//

#import "KMCustomAlertView.h"

@implementation KMCustomAlertView

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSArray *subviews = self.subviews;
    NSInteger cancelButtonTag = [self cancelButtonTag];
    
    for (UIView *view in subviews) {
        
        // buttons
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *oldButton = ((UIButton *)view);
            UIButton *newButton = (oldButton.tag == cancelButtonTag) ? [self cancelButton] : [self otherButton];
            newButton.frame = oldButton.frame;
            newButton.tag = oldButton.tag;
            [newButton setTitle:oldButton.titleLabel.text forState:UIControlStateNormal];
            
            NSArray *targets = [oldButton actionsForTarget:self forControlEvent:UIControlEventTouchUpInside];
            SEL selector = NSSelectorFromString([targets objectAtIndex:0]);
            [newButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:newButton];
            [oldButton removeFromSuperview];
        
        // labels
        } else if ([view isKindOfClass:[UILabel class]]) {
            UILabel *oldLabel = (UILabel *)view;
            UILabel *newLabel = ([oldLabel.text isEqualToString:self.title]) ? [self titleLabel] : [self messageLabel];
            newLabel.frame = oldLabel.frame;
            newLabel.text = oldLabel.text;
            
            [self addSubview:newLabel];
            [oldLabel removeFromSuperview];
            
        // background view
        } else if ([view isKindOfClass:[UIImageView class]]) {
            UIImageView *oldBackgroundView = (UIImageView *)view;
            UIView *newBackgroundView = [self backgroundView];
            newBackgroundView.frame = oldBackgroundView.frame;
            newBackgroundView.userInteractionEnabled = NO;
            
            [self insertSubview:newBackgroundView belowSubview:oldBackgroundView];
            [oldBackgroundView removeFromSuperview];
        }
    }
}

- (NSInteger)cancelButtonTag {
    NSInteger numberOfButtons = self.numberOfButtons;
    NSInteger cancelButtonIndex = self.cancelButtonIndex;
    NSInteger cancelButtonTag = -1;
    
    if (numberOfButtons > 1) {
        if (cancelButtonIndex < 0) {
            if (numberOfButtons == 2) {
                cancelButtonTag = 1;
            } else {
                cancelButtonTag = numberOfButtons;
            }
        } else {
            cancelButtonTag = 1;
        }
    }
    
    return cancelButtonTag;
}

- (UILabel *)titleLabel {
    [self assertAbstractSelector:_cmd];
    return nil;
}

- (UILabel *)messageLabel {
    [self assertAbstractSelector:_cmd];
    return nil;
}


- (UIButton *)cancelButton {
    [self assertAbstractSelector:_cmd];
    return nil;
}


- (UIButton *)otherButton {
    [self assertAbstractSelector:_cmd];
    return nil;
}


- (UIView *)backgroundView {
    [self assertAbstractSelector:_cmd];
    return nil;
}

- (void)assertAbstractSelector:(SEL)selector {
    NSAssert(NO, @"%@: %@ must be overriden by subclasses.", NSStringFromClass([self class]), NSStringFromSelector(selector));
}

@end

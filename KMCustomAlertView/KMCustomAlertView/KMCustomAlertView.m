//
//  KMAlertView.m
//  KMCustomAlertView
//
//  Created by Kasper Munck on 12/6/12.
//  Copyright (c) 2012 KAPPS. All rights reserved.
//

#import "KMCustomAlertView.h"

@implementation KMCustomAlertView

// by analyzing the call stack we know that addSubview is called from the
// private methods _createTitleLabelIfNeeded and _createBodyTextLabelIfNeeded
// to add titleLabel and messageLabel, respectively. Size calculations are
// made after the labels are added so bare injecting our custom font at this
// point, we make sure that any size calculations are made based on the
// correct font and size.
- (void)addSubview:(UIView *)view {
    NSArray *symbols = [NSThread callStackSymbols];
    NSString *callingMethod = [symbols objectAtIndex:1];
    
    NSRegularExpression *titleLabelRegex = [self regexWithpattern:@"_createTitleLabelIfNeeded"]; 
    NSRegularExpression *messageLabelRegex = [self regexWithpattern:@"_createBodyTextLabelIfNeeded"];
    
    BOOL isTitleLabel = [self doesString:callingMethod regex:titleLabelRegex];
    BOOL isMessageLabel = [self doesString:callingMethod regex:messageLabelRegex];
    
    if ([view isKindOfClass:[UILabel class]]) {
        if (isTitleLabel)
            ((UILabel *)view).font = [self titleLabel].font;
        else if (isMessageLabel)
            ((UILabel *)view).font = [self messageLabel].font;
        
    }
    
    [super addSubview:view];
    
}

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
            
            newLabel.numberOfLines = oldLabel.numberOfLines;
            newLabel.lineBreakMode = oldLabel.lineBreakMode;
            newLabel.adjustsFontSizeToFitWidth = oldLabel.adjustsFontSizeToFitWidth;
            newLabel.adjustsLetterSpacingToFitWidth = oldLabel.adjustsLetterSpacingToFitWidth;
            
            
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

#pragma mark -
#pragma mark Helpers

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

- (NSRegularExpression *)regexWithpattern:(NSString *)pattern {
    return [NSRegularExpression regularExpressionWithPattern:pattern
                                                     options:0
                                                       error:nil];
}

- (BOOL)doesString:(NSString *)str regex:(NSRegularExpression *)regex {
    return [regex numberOfMatchesInString:str options:0 range:NSMakeRange(0, str.length)];
}

- (void)assertAbstractSelector:(SEL)selector {
    NSAssert(NO, @"%@: %@ must be overriden by subclasses.", NSStringFromClass([self class]), NSStringFromSelector(selector));
}

#pragma mark -
#pragma mark Abstract Methods

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

@end

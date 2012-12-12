//
//  KMAlertView.h
//  KMCustomAlertView
//
//  Created by Kasper Munck on 12/6/12.
//  Copyright (c) 2012 KAPPS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMCustomAlertView : UIAlertView

- (UILabel *)titleLabel;
- (UILabel *)messageLabel;
- (UIButton *)cancelButton;
- (UIButton *)otherButton;
- (UIView *)backgroundView;

@end

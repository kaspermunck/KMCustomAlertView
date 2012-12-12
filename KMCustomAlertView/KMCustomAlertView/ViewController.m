//
//  ViewController.m
//  KMCustomAlertView
//
//  Created by Kasper Munck on 12/11/12.
//  Copyright (c) 2012 KAPPS. All rights reserved.
//

#import "ViewController.h"
#import "MyAlertView.h"

@interface ViewController () <UIAlertViewDelegate>

@end

@implementation ViewController

- (IBAction)presentAlert:(id)sender {
    UIAlertView *alert = [[MyAlertView alloc] initWithTitle:@"Custom UIAlertView"
                                                    message:@"Hurra, this is a custom alert view. Now it's time to style those alerts!"
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"other", @"cancel", @"yo", nil];
    [alert show];
}

@end

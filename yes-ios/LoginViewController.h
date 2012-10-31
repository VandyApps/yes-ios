//
//  LoginViewController.h
//  yes-ios
//
//  Created by Lane on 10/27/12.
//  Copyright (c) 2012 VandyMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewDelegate <NSObject>

- (void)readyToDismiss;

@end

@interface LoginViewController : UITableViewController


@property (nonatomic, assign) id <LoginViewDelegate> delegate;

- (IBAction)cancelPressed:(id)sender;
- (IBAction)login:(id)sender;

@end

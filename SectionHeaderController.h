//
//  SectionHeaderController.h
//  yes-ios
//
//  Created by Lane on 10/26/12.
//  Copyright (c) 2012 VandyMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SectionHeaderDelegate <NSObject>

- (void)performActionFromMap;
- (void)performActionFromCalendar;
- (void)performActionFromFacebook;

@end

@interface SectionHeaderController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *calendarButton;
@property (strong, nonatomic) IBOutlet UIButton *facebookButton;
@property (strong, nonatomic) IBOutlet UIButton *mapButton;

@property (nonatomic, assign) id <SectionHeaderDelegate> delegate;

- (IBAction)pressedCalButton:(id)sender;
- (IBAction)pressedFacebookButton:(id)sender;
- (IBAction)pressedMapButton:(id)sender;

@end

//
//  ClassSearchViewController.h
//  yes-ios
//
//  Created by Matt Cooley on 9/15/12.
//  Copyright (c) 2012 VandyMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassSearchViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray* dummySections;
    NSArray* dummyRows;
}

@end

//
//  ClassDetailController.h
//  yes-ios
//
//  Created by Lane on 10/23/12.
//  Copyright (c) 2012 VandyMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SectionHeaderController.h"
#import "MapViewController.h"


@interface ClassDetailController : UITableViewController
    <UITableViewDataSource, UITableViewDelegate, SectionHeaderDelegate, MapViewDelegate>

@end

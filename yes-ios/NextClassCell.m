//
//  NextClassCell.m
//  yes-ios
//
//  Created by Lane on 10/30/12.
//  Copyright (c) 2012 VandyMobile. All rights reserved.
//

#import "NextClassCell.h"

@implementation NextClassCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)mapButtonPressed:(id)sender {
}
@end

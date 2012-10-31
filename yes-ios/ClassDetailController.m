//
//  ClassDetailController.m
//  yes-ios
//
//  Created by Lane on 10/23/12.
//  Copyright (c) 2012 VandyMobile. All rights reserved.
//

#import "ClassDetailController.h"
#import "ItemCell.h"
#import "SectionCell.h"
#import "MapViewController.h"


@interface ClassDetailController ()
{
    NSString* description;
    NSArray* sectionDetails;
    NSString* creditHours;
    
    NSIndexPath* selectedRow;
}

@end

// Credit hours
// Description
// Sections
//  --> Calendar, Facebook, Map
//  --> Enrollment Size, Waitlist Size
//  --> Professor
//  --> Time Schedule
//  --> Location

@implementation ClassDetailController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    creditHours = @"3 hours";
    description = @"Normally accompanied by 118b. Calculus-based introduction to general physics and its applications. Electricity and magnetism, optics, modern physics. Potential majors are strongly advised to take MATH 155b or a higher level calculus course. Prior study of calculus or concurrent enrollment in Math 150b or 155b is expected. [3] (MNS)";
    
    sectionDetails = @[ @{@"Prof" : @"Lawler",
    @"Loc" : @"SC 4327",
    @"Time" : @"11:10a-12:00p",
    @"Day" : @"MWF",
    @"Enrolled" : @0,
    @"Size" : @130},
    
    @{@"Prof" : @"Lawler",
    @"Loc" : @"SC 4309",
    @"Time" : @"2:10p-3:00p",
    @"Day" : @"MWF",
    @"Enrolled" : @37,
    @"Size" : @150},
    
    @{@"Prof" : @"Csorna",
    @"Loc" : @"SC 4327",
    @"Time" : @"11:00a-12:15p",
    @"Day" : @"TR",
    @"Enrolled" : @7,
    @"Size" : @150}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    switch (section)
    {
        case 0:
            return 1;
        case 1:
            return 1;
        case 2:
            return 3;
            
        default:
            return 0;
    }
}

- (ItemCell *)itemCellForTableView:(UITableView *)tableView atPath:(NSIndexPath *)path
{
    static NSString *ItemCellIdentifier = @"ItemCell";
    ItemCell* cell = [tableView dequeueReusableCellWithIdentifier:ItemCellIdentifier forIndexPath:path];
    if (cell == nil)
    {
        cell = [[ItemCell alloc] init];
    }
    
    cell.titleLabel.text = @"Credit";
    cell.contentLabel.text = creditHours;
    return cell;
}

- (UITableViewCell *)descriptionCellForTableView:(UITableView *)tableView atPath:(NSIndexPath *)path
{
    static NSString *DescriptionCellIdentifier = @"DescriptionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DescriptionCellIdentifier forIndexPath:path];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DescriptionCellIdentifier];
    }
    
    cell.textLabel.text = description;
    return cell;
}

- (SectionCell *)sectionCellForTableView:(UITableView *)tableView atPath:(NSIndexPath *)path
{
    static NSString *SectionCellIdentifier = @"SectionCell";
    SectionCell *cell = [tableView dequeueReusableCellWithIdentifier:SectionCellIdentifier forIndexPath:path];
    if (cell == nil)
    {
        cell = [[SectionCell alloc] init];
    }
    
    NSDictionary *data = [sectionDetails objectAtIndex:path.row];
    cell.profLabel.text = [data objectForKey:@"Prof"];
    cell.dayLabel.text = [data objectForKey:@"Day"];
    cell.timeLabel.text = [data objectForKey:@"Time"];
    cell.locLabel.text = [data objectForKey:@"Loc"];
    
    if([selectedRow isEqual:path])
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return [self itemCellForTableView:tableView atPath:indexPath];
        case 1:
            return [self descriptionCellForTableView:tableView atPath:indexPath];
        case 2:
            return [self sectionCellForTableView:tableView atPath:indexPath];
        default:
            return nil;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 2)
    {
        UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        
        UIButton *calButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [calButton setFrame:CGRectMake(10, 0, 50, 44)];
        [calButton setTitle:@"Cal" forState:UIControlStateNormal];
        
        UIButton *mapButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [mapButton setFrame:CGRectMake(260, 0, 50, 44)];
        [mapButton setTitle:@"Map" forState:UIControlStateNormal];
        [mapButton addTarget:self action:@selector(pressedMap:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *facebookButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [facebookButton setFrame:CGRectMake(205, 0, 44, 44)];
        [facebookButton setImage:[UIImage imageNamed:@"f_logo.png"] forState:UIControlStateNormal];
        
        [header addSubview:calButton];
        [header addSubview:mapButton];
        [header addSubview:facebookButton];
        
        return header;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2)
    {
        return 50;
    }

    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Description section
    if (indexPath.section == 1)
    {
        return tableView.rowHeight * 4;
    }
    if (indexPath.section == 2)
    {
        return tableView.rowHeight * 1.2;
    }
    else
    {
        return tableView.rowHeight;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Uncheck the previous checked row
    if(indexPath.section == 2)
    {
        if (selectedRow)
        {
            UITableViewCell* uncheckCell = [tableView cellForRowAtIndexPath:selectedRow];
            uncheckCell.accessoryType = UITableViewCellAccessoryNone;
        }
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        selectedRow = indexPath;
    }
}

#pragma mark - MapViewDelegate methods
- (void)readyToDismiss
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - SectionHeaderDelegate methods

- (void)performActionFromCalendar
{
    NSLog(@"Calendar pressed");
}

- (void)performActionFromFacebook
{
    NSLog(@"Facebook pressed");
}

- (void)pressedMap:(id)sender
{
    MapViewController* mapView = [[MapViewController alloc] init];
    mapView.delegate = self;
    [self presentModalViewController:mapView animated:YES];
}

@end

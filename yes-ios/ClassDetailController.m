//
//  ClassDetailController.m
//  yes-ios
//
//  Created by Lane on 10/23/12.
//  Copyright (c) 2012 VandyMobile. All rights reserved.
//

#import "ClassDetailController.h"


@interface ClassDetailController ()
{
    NSString* description;
    NSArray* sectionDetails;
    NSString* creditHours;
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
    NSLog(@"Here!");
    
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
    
    creditHours = @"3";
    description = @"Normally accompanied by 118b. Calculus-based introduction to general physics and its applications. Electricity and magnetism, optics, modern physics. Potential majors are strongly advised to take MATH 155b or a higher level calculus course. Prior study of calculus or concurrent enrollment in Math 150b or 155b is expected. [3] (MNS)";
    
    sectionDetails = @[ @{@"Prof" : @"Lawler",
    @"Loc" : @"SC 4327",
    @"Time" : @"11:10a-12:00p",
    @"Day" : @"MWF",
    @"Enrolled" : @0,
    @"Size" : @130},
    
    @{@"Prof" : @"Lawler",
    @"Loc" : @"SC 4309",
    @"Time" : @"2:10a-3:00p",
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
            return 4;
            
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ClassDetailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString* textToShow;
    
    switch (indexPath.section)
    {
        case 0:
            textToShow = creditHours;
            break;
        case 1:
            textToShow = description;
            break;
        case 2:
            if (indexPath.row == 0)
            {
                textToShow = @"Cal  Facebook  Map";
            }
            else
            {
                textToShow = [[sectionDetails objectAtIndex:indexPath.row-1] objectForKey:@"Prof"];
            }
            break;
        default:
            break;
    }
    cell.textLabel.text = textToShow;
    
    return cell;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Description section
    if (indexPath.section == 1)
    {
        return tableView.rowHeight * 5;
    }
    else
    {
        return tableView.rowHeight;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end

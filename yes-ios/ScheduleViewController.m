//
//  ScheduleViewController.m
//  yes-ios
//
//  Created by Matt Cooley on 9/15/12.
//  Copyright (c) 2012 VandyMobile. All rights reserved.
//

#import "ScheduleViewController.h"
#import "LoginViewController.h"
#import "NextClassCell.h"
#import "ItemCell.h"
#import "ClassCell.h"
#import "FacebookCell.h"

@interface ScheduleViewController ()
{
    bool hasPresentedLogin;
    LoginViewController *modalLogin;
    
    NSArray *classData;
}

@end

@implementation ScheduleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Code here.
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    if (!hasPresentedLogin)
    {
        
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        modalLogin = (LoginViewController *)[storyBoard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [modalLogin setDelegate:self];
        
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:modalLogin];
        [self presentModalViewController:navController animated:YES];
        hasPresentedLogin = true;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    hasPresentedLogin = false;
    
    classData = @[@{@"Class" : @"Intro to Composition",
                    @"Prof" : @"Henderson",
                    @"Day" : @"MWF",
                    @"Time" : @"11:10a-12:00p",
                    @"Loc" : @"Furman 212",
                    @"Code" : @"Engl 110"},
    @{@"Class" : @"Programming Languages",
    @"Prof" : @"Roth",
    @"Day" : @"MWF",
    @"Time" : @"2:10p-3:00p",
    @"Loc" : @"FGH 238",
    @"Code" : @"CS 270"},
    @{@"Class" : @"Spanish Literature",
    @"Prof" : @"Garcia",
    @"Day" : @"MWF",
    @"Time" : @"10:10a-11:00a",
    @"Loc" : @"Calhoun 110",
    @"Code" : @"Span 203"},
    @{@"Class" : @"Linear Algebra",
    @"Prof" : @"Chifan",
    @"Day" : @"TR",
    @"Time" : @"8:10a-9:25a",
    @"Loc" : @"SC 1203",
    @"Code" : @"Math 204"},
    @{@"Class" : @"Calculus II",
    @"Prof" : @"Pigg",
    @"Day" : @"TR",
    @"Time" : @"9:35a-10:50a",
    @"Loc" : @"SC 1314",
    @"Code" : @"Math 155b"}];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - LoginViewDelegate
- (void)readyToDismiss
{
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - Table view data source methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return 1;
        case 1:
            return [classData count];
        case 2:
            return 1;
        case 3:
            return 1;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return [self nextClassCellForTableView:tableView atPath:indexPath];
        case 1:
            return [self classCellForTableView:tableView atPath:indexPath];
        case 2:
            return [self itemCellForTableView:tableView atPath:indexPath];
        case 3:
            return [self facebookCellForTableView:tableView atPath:indexPath];
        default:
            return nil;
    }
}

- (UITableViewCell *)nextClassCellForTableView:(UITableView *)tableView atPath:(NSIndexPath *)path
{
    static NSString *NextClassCellIdentifier = @"NextClassCell";
    NextClassCell *cell = [tableView dequeueReusableCellWithIdentifier:NextClassCellIdentifier forIndexPath:path];
    if (cell == nil)
    {
        cell = [[NextClassCell alloc] init];
    }
    
    [[cell classTitleLabel] setText:@"Intro to Composition"];
    [[cell timeUntilLabel] setText:@"Begins in 17 min"];
    [[cell mapButton] addTarget:self action:@selector(presentMap:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (UITableViewCell *)classCellForTableView:(UITableView *)tableView atPath:(NSIndexPath *)path
{
    static NSString *ClassCellIdentifier = @"ClassCell";
    ClassCell *cell = [tableView dequeueReusableCellWithIdentifier:ClassCellIdentifier forIndexPath:path];
    if (cell == nil)
    {
        cell = [[ClassCell alloc] init];
    }
    
    NSDictionary *data = [classData objectAtIndex:path.row];
    [[cell classTitleLabel] setText:[data objectForKey:@"Class"]];
    [[cell classCodeLabel] setText:[data objectForKey:@"Code"]];
    [[cell professorLabel] setText:[data objectForKey:@"Prof"]];
    [[cell dayLabel] setText:[data objectForKey:@"Day"]];
    [[cell timeLabel] setText:[data objectForKey:@"Time"]];
    [[cell locationLabel] setText:[data objectForKey:@"Loc"]];
    
    return cell;
}

- (UITableViewCell *)itemCellForTableView:(UITableView *)tableView atPath:(NSIndexPath *)path
{
    static NSString *ItemCellIdentifier = @"ItemCell";
    ItemCell* cell = [tableView dequeueReusableCellWithIdentifier:ItemCellIdentifier forIndexPath:path];
    if (cell == nil)
    {
        cell = [[ItemCell alloc] init];
    }
    
    cell.titleLabel.text = @"Credit";
    cell.contentLabel.text = @"15 hours";
    return cell;
}

- (UITableViewCell *)facebookCellForTableView:(UITableView *)tableView atPath:(NSIndexPath *)path
{
    static NSString *FacebookCellIdentifier = @"FacebookCell";
    FacebookCell* cell = [tableView dequeueReusableCellWithIdentifier:FacebookCellIdentifier forIndexPath:path];
    if (cell == nil)
    {
        cell = [[FacebookCell alloc] init];
    }
    
    [[cell facebookButton] addTarget:self action:@selector(presentFacebook:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark - Table view delegate methods

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section)
    {
        case 0:
            return 70;
        case 1:
            return 70;
            
        default:
            return tableView.rowHeight;
    }
}

#pragma mark - Actions

- (void)presentMap:(id)sender
{
    NSLog(@"Presenting map");
}

- (void)presentFacebook:(id)sender
{
    NSLog(@"Presenting facebook");
}

@end

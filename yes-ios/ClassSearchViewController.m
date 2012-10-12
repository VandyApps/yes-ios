//
//  ClassSearchViewController.m
//  yes-ios
//
//  Created by Matt Cooley on 9/15/12.
//  Copyright (c) 2012 VandyMobile. All rights reserved.
//

#import "ClassSearchViewController.h"

@interface ClassSearchViewController ()

@end

@implementation ClassSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Using container literals to save space.
    dummySections = @[@"Biology", @"English", @"Physics"];
    dummyRows = @[ @[@"Intro", @"Molecular Bio", @"Ecosystems"],
                   @[@"Composition", @"18th Century", @"Modern Lit"],
                   @[@"Intro", @"Nanomaterials", @"Thermodynamics"]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"TempCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [[dummyRows objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[dummyRows objectAtIndex:section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dummySections count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [dummySections objectAtIndex:section];
}

@end

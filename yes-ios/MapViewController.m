//
//  MapViewController.m
//  yes-ios
//
//  Created by Lane on 10/27/12.
//  Copyright (c) 2012 VandyMobile. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()
{
    CLLocationManager* locationManager;
}

@end

@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        [locationManager startUpdatingLocation];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)donePressed:(id)sender
{
    [_delegate readyToDismiss];
}

#pragma mark - CLLocationManager Delegate Methods

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    // Most current location located at end of array
    CLLocation *loc = [locations objectAtIndex:[locations count] - 1];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(loc.coordinate, 1000, 1000);
    [_mapView setRegion:viewRegion animated:YES];
}

@end

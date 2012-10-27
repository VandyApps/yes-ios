//
//  MapViewController.h
//  yes-ios
//
//  Created by Lane on 10/27/12.
//  Copyright (c) 2012 VandyMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@protocol MapViewDelegate <NSObject>

- (void)readyToDismiss;

@end

@interface MapViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView* mapView;
@property (nonatomic, assign) id <MapViewDelegate> delegate;

- (IBAction)donePressed:(id)sender;

@end

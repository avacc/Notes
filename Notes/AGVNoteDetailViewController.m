//
//  AGVViewController.m
//  Notes
//
//  Created by Alex on 3/1/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "AGVNoteDetailViewController.h"


@implementation AGVNoteDetailViewController


- (void) viewDidLoad {
    [super viewDidLoad];
    MKCoordinateSpan span;
    span.latitudeDelta = 0.040;
    span.longitudeDelta = 0.040;
    MKCoordinateRegion region;
    region.span = span;
    NSArray* array = [self.map annotations];
    MKPointAnnotation* pin = (MKPointAnnotation*) array.lastObject;
    region.center = pin.coordinate;
    [self.map setRegion: region animated: YES];
}

- (void) addPinToMapAtLocation: (CLLocationCoordinate2D) location withName: (NSString*) locationName {
    MKPointAnnotation* pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = location;
    pin.title = locationName;
    [self.map addAnnotation: pin];
    [self.map setCenterCoordinate: pin.coordinate animated: YES];
}

@end

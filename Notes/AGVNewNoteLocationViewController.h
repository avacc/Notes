//
//  AGVNewNoteLocationViewController.h
//  Notes
//
//  Created by Alex on 3/7/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Note.h"


@interface AGVNewNoteLocationViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView* map;
@property (strong, nonatomic) Note* noteToBeSaved;
@property (strong, nonatomic) NSString* locationName;

- (void) addPinToMapAtLocation: (CLLocationCoordinate2D) location;
- (IBAction) respondToLongPress: (UILongPressGestureRecognizer*) longPressRecognizer;


@end

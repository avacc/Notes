//
//  AGVViewController.h
//  Notes
//
//  Created by Alex on 3/1/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AGVNoteDetailViewController : UIViewController

@property (strong, nonatomic) UILabel* noteTitle;
@property (strong, nonatomic) IBOutlet UITextView* content;
@property (strong, nonatomic) IBOutlet MKMapView* map;
//@property (strong, nonatomic) MKPointAnnotation* location;

- (void) addPinToMapAtLocation: (CLLocationCoordinate2D) location withName: (NSString*) locationName;


@end
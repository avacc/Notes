//
//  Note.h
//  Notes
//
//  Created by Alex on 3/7/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Note : NSObject {
    CLLocationCoordinate2D location;
    NSString* locationName;
}

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* content;

- (void) setLocation: (CLLocationCoordinate2D) newLocation;
- (void) setLocationName: (NSString*) newLocationName;
- (CLLocationCoordinate2D) getLocation;
- (NSString*) getLocationName;

@end

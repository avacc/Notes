//
//  Note.m
//  Notes
//
//  Created by Alex on 3/7/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "Note.h"

@implementation Note

- (void) setLocation: (CLLocationCoordinate2D) newLocation {
    location = newLocation;
}

- (void) setLocationName: (NSString*) newLocationName {
    locationName = newLocationName;
}

- (CLLocationCoordinate2D) getLocation {
    return location;
}

- (NSString*) getLocationName {
    return locationName;
}
@end

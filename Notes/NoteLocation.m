//
//  NoteLocation.m
//  Notes
//
//  Created by Alex Vaccarino on 3/25/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "NoteLocation.h"


@implementation NoteLocation

@dynamic locationName;
@dynamic latitude;
@dynamic longitude;
@dynamic note;

/*
- (NSString*) locationName {
    if(self.locationName){
        return self.locationName;
    }
    self.locationName = [[NSString alloc] init];
    return self.locationName;
}

- (void) setLocationName: (NSString*) locationName {
    self.locationName = locationName;
}

- (NSString*) latitude {
    if(self.latitude){
        return self.latitude;
    }
    self.latitude = [[NSString alloc] init];
    return self.latitude;
}

- (void) setLatitude: (NSString*) latitude {
    self.latitude = latitude;
}

- (NSString*) longitude {
    if(self.longitude){
        return self.longitude;
    }
    self.longitude = [[NSString alloc] init];
    return self.longitude;
}

- (void) setLongitude: (NSString*) longitude {
    self.longitude = longitude;
}

- (Note*) note {
    if(self.note){
        return self.note;
    }
    return nil;
}

- (void) setNote: (Note*) note {
    self.note = note;
}*/
@end

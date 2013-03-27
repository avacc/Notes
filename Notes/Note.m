//
//  Note.m
//  Notes
//
//  Created by Alex on 3/7/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "Note.h"

@implementation Note

@dynamic title;
@dynamic content;
@dynamic timestamp;
@dynamic noteLocation;

/*
- (NSString*) title {
    if(){
        return self.title;
    }
    self.title = [[NSString alloc] init];
    return self.title;
}

- (void) setTitle: (NSString*) title {
    if([self title] != nil){
        self.title = title;
    }
}

- (NSString*) content {
    if(self.content != nil){
        return self.content;
    }
    self.content = [[NSString alloc] init];
    return self.content;
}

- (void) setContent: (NSString*) content {
    if([self content] != nil){
        self.content = content;
    }
}

- (NSDate*) timestamp {
    if(self.timestamp != nil){
        return self.timestamp;
    }
    self.timestamp = [NSDate date];
    return self.timestamp;
}

- (void) setTimestamp: (NSDate*) timestamp {
    if([self timestamp] != nil){
        self.timestamp = timestamp;
    }
}

- (NoteLocation*) noteLocation {
    if(self.noteLocation != nil){
        return self.noteLocation;
    }
    return nil;
}

- (void) setNoteLocation: (NoteLocation*) noteLocation {
    self.noteLocation = noteLocation;
}*/
@end

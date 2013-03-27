//
//  Note.h
//  Notes
//
//  Created by Alex on 3/7/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreData/CoreData.h>

@class NoteLocation;

@interface Note : NSManagedObject 

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* content;
@property (strong, nonatomic) NSDate* timestamp;
@property (strong, nonatomic) NoteLocation* noteLocation;

@end

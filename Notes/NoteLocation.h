//
//  NoteLocation.h
//  Notes
//
//  Created by Alex Vaccarino on 3/25/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Note;

@interface NoteLocation : NSManagedObject

@property (strong, nonatomic) NSString* locationName;
@property (strong, nonatomic) NSString* latitude;
@property (strong, nonatomic) NSString* longitude;
@property (strong, nonatomic) Note* note;

@end

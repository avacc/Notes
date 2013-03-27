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
#import <CoreData/CoreData.h>
#import "Note.h"
#import "NoteLocation.h"

@class AGVNotesViewController;

@protocol AGVNewNoteLocationViewControllerDelegate <NSObject>

- (NSManagedObjectContext*) getContext;

@end

@interface AGVNewNoteLocationViewController : UIViewController <UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet AGVNotesViewController* delegate;
@property (strong, nonatomic) IBOutlet MKMapView* map;
@property (strong, nonatomic) NSString* latitude;
@property (strong, nonatomic) NSString* longitude;
//@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* noteTitle;
@property (strong, nonatomic) NSString* noteContent;
//@property (strong, nonatomic) Note* noteToBeSaved;
@property (strong, nonatomic) NSString* locationName;
//@property (strong, nonatomic) NoteLocation* noteLocationToBeSaved;



- (void) addPinToMapAtLocation: (CLLocationCoordinate2D) location;
- (IBAction) respondToLongPress: (UILongPressGestureRecognizer*) longPressRecognizer;


@end

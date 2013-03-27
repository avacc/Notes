//
//  AGVNotesViewController.h
//  Notes
//
//  Created by Alex on 3/3/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AGVNoteDetailViewController.h"
#import "AGVNewNoteContentViewController.h"
#import "AGVNewNoteLocationViewController.h"
#import "NoteLocation.h"
#import "NoteCell.h"

#define AGVCellIdentifier @"My Cell Identifier"
#define AGVEntityName @"Note"
#define AGVEntityLocationName @"NoteLocation"
#define AGVSaveError @"Error saving note: %@"


@interface AGVNotesViewController : UITableViewController <NSURLConnectionDataDelegate, NSFetchedResultsControllerDelegate, AGVNewNoteLocationViewControllerDelegate>

@property (strong, nonatomic) NSMutableArray* notes;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;
@property (retain, nonatomic) NSFetchedResultsController* fetchedResultsController;

- (IBAction) saveNote: (UIStoryboardSegue*) segue;
- (IBAction) cancelNote: (UIStoryboardSegue*) segue;
- (IBAction) edit;

//- (BOOL) addNoteWithTitle: (NSString*) title content: (NSString*) content;




@end

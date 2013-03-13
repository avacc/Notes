//
//  AGVNotesViewController.h
//  Notes
//
//  Created by Alex on 3/3/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AGVNoteDetailViewController.h"
#import "AGVNewNoteContentViewController.h"
#import "AGVNewNoteLocationViewController.h"
#import "NoteCell.h"

#define AGVCellIdentifier @"My Cell Identifier"


@interface AGVNotesViewController : UITableViewController <NSURLConnectionDataDelegate>

@property (strong, nonatomic) NSMutableArray* notes;


- (IBAction) saveNote: (UIStoryboardSegue*) segue;
- (IBAction) cancelNote: (UIStoryboardSegue*) segue;

- (UITableViewCell*) tableView: (UITableView*) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath;





@end

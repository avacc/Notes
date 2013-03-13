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
#define AGVFourSquareURL @"https://api.foursquare.com/v2/venues/search?ll=39.9597,-75.1968&oauth_token=YOUROAUTHTOKENHERE&v=2013224"

@interface AGVNotesViewController : UITableViewController <NSURLConnectionDataDelegate>

@property (strong, nonatomic) NSMutableArray* notes;
//@property (strong, nonatomic) NSMutableArray* notes;
//@property (strong, nonatomic) NSArray* locations;
//@property (strong, nonatomic) NSMutableData* data;

- (IBAction) saveNote: (UIStoryboardSegue*) segue;
- (IBAction) cancelNote: (UIStoryboardSegue*) segue;
//- (NSInteger) tableView: (UITableView*) tableView numberOfRowsInSection: (NSInteger) section;
- (UITableViewCell*) tableView: (UITableView*) tableView cellForRowAtIndexPath: (NSIndexPath *) indexPath;
/*
#pragma mark - NSURLConnectionDataDelegate Methods

- (void) connection: (NSURLConnection*) connection didReceiveResponse: (NSURLResponse*) response;
- (void) connection: (NSURLConnection*) connection didReceiveData: (NSData*) data;
- (void) connection: (NSURLConnection*) connection didFailWithError: (NSError*) error;
- (void) connectionDidFinishLoading: (NSURLConnection*) connection;
*/




@end

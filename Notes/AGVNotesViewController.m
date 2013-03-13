//
//  AGVTableViewController.m
//  Notes
//
//  Created by Alex on 3/3/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "AGVNotesViewController.h"


@implementation AGVNotesViewController

- (id) init {
    self = [super init];
    if(self){
        self.notes = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    [self init];
    
}

- (IBAction) saveNote: (UIStoryboardSegue*) segue {
    AGVNewNoteLocationViewController* source = segue.sourceViewController;
    Note* newNote = source.noteToBeSaved;
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow: [self.notes count] inSection: 0];
    [self.notes addObject: newNote];
    
    NSArray* array = [[NSArray alloc] initWithObjects: indexPath, nil];
    NSLog(@"%d", [self.tableView numberOfRowsInSection: 0]);
    [self.tableView insertRowsAtIndexPaths: array withRowAnimation: UITableViewRowAnimationAutomatic];
    NoteCell* cell = (NoteCell*) [self.tableView cellForRowAtIndexPath: indexPath];

    cell.textLabel.text = source.noteToBeSaved.title;
    [self.tableView reloadData];
}

- (IBAction) cancelNote: (UIStoryboardSegue*) segue {
    
}

- (UITableViewCell*) tableView: (UITableView*) tableView cellForRowAtIndexPath: (NSIndexPath*) indexPath {
    NoteCell* cell = (NoteCell*)[self.tableView dequeueReusableCellWithIdentifier: AGVCellIdentifier];
    
    if(!cell){
        cell = [[NoteCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: AGVCellIdentifier];
    }
    
        
    return cell;
}

- (NSInteger) numberOfSectionsInTableView: (UITableView*) tableView {
    return 1;
}

- (NSInteger) tableView: (UITableView*) tableView numberOfRowsInSection: (NSInteger) section {
    return [self.notes count];
}

#pragma mark - Segue

- (void) prepareForSegue: (UIStoryboardSegue*) segue sender: (id) sender {
    if([segue.identifier isEqualToString:@"noteDetailsSegue"] || [segue.identifier isEqualToString:@"detailNoteViewSegue"]){
        NSLog(@"segue happened");
        AGVNoteDetailViewController* destination = segue.destinationViewController;
        if([destination view]){
            NoteCell* cell = (NoteCell*)[self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
            Note* note = [self.notes objectAtIndex: [self.tableView indexPathForSelectedRow].row];
            destination.noteTitle.text = note.title;
            destination.content.text = note.content;
            [destination addPinToMapAtLocation: [note getLocation] withName: [note getLocationName]];
            MKCoordinateSpan span;
            span.latitudeDelta = 0.040;
            span.longitudeDelta = 0.040;
            MKCoordinateRegion region;
            region.span = span;
            region.center = [note getLocation];
            [destination.map setRegion: region animated: YES];
        }
    }
}
@end
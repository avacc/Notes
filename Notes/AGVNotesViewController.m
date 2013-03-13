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
    /*NSURLRequest* request = [NSURLRequest requestWithURL: [NSURL URLWithString: AGVFourSquareURL]];
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest: request delegate: self];
    [connection start];*/
    [self init];
    
}

- (IBAction) saveNote: (UIStoryboardSegue*) segue {
    AGVNewNoteLocationViewController* source = segue.sourceViewController;
    Note* newNote = source.noteToBeSaved;
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow: [self.notes count] inSection: 0];
    [self.notes addObject: newNote];
    /*if(self.notes != nil){
        NSLog(@"noteToBeSaved is not nil: name:%@", source.noteToBeSaved.title);
    }
    if([self.notes count] == 0){
        NSLog(@"notes is empty");
    }
    NSLog(@"%d", [self.notes count]);*/
    NSArray* array = [[NSArray alloc] initWithObjects: indexPath, nil];
    NSLog(@"%d", [self.tableView numberOfRowsInSection: 0]);
    [self.tableView insertRowsAtIndexPaths: array withRowAnimation: UITableViewRowAnimationAutomatic];
    NoteCell* cell = (NoteCell*) [self.tableView cellForRowAtIndexPath: indexPath];
    //cell.associatedNote = source.noteToBeSaved;
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
    /*
    Note* note = [self.notes objectAtIndex: indexPath.row];
    cell.associatedNote = note;
    */ 
        
    return cell;
}

- (NSInteger) numberOfSectionsInTableView: (UITableView*) tableView {
    return 1;
}

- (NSInteger) tableView: (UITableView*) tableView numberOfRowsInSection: (NSInteger) section {
    return [self.notes count];
}
/*
#pragma mark - NSURLConnectionDataDelegate Methods

- (void) connection: (NSURLConnection*) connection didReceiveResponse: (NSURLResponse*) response {
    _data = [[NSMutableData alloc] init];
}

- (void) connection: (NSURLConnection*) connection didReceiveData: (NSData*) data {
    [_data appendData: data];
}

- (void) connection: (NSURLConnection*) connection didFailWithError: (NSError*) error {
    
}

- (void) connectionDidFinishLoading: (NSURLConnection*) connection {
    NSDictionary* foursquareResponse = [NSJSONSerialization JSONObjectWithData: _data options: 0 error: nil];
    self.locations = foursquareResponse[@"response"][@"venues"];
    [self.tableView reloadData];
    NSLog(@"%@", foursquareResponse);
}
*/
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
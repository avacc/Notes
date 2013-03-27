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
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View Loaded");
    NSError *error;
	if (![[self fetchedResultsController] performFetch: &error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		exit(-1); 
	}
    NSLog(@"NotesViewController init'ed");
}


- (IBAction) saveNote: (UIStoryboardSegue*) segue {
    AGVNewNoteLocationViewController* source = segue.sourceViewController;
    Note* newNote = [NSEntityDescription insertNewObjectForEntityForName: AGVEntityName inManagedObjectContext: [self managedObjectContext]];
    newNote.title = source.noteTitle;
    newNote.content = source.noteContent;
    newNote.timestamp = [NSDate date];
    NSLog(@"note instantiated");
    NoteLocation* newNoteLocation = [NSEntityDescription insertNewObjectForEntityForName: AGVEntityLocationName inManagedObjectContext: [self managedObjectContext]];
    NSLog(@"Location Name about to happen");
    [newNoteLocation setValue: source.locationName forKey: @"locationName"];
    //newNoteLocation.name = source.locationName;
    newNoteLocation.latitude = source.latitude;
    newNoteLocation.longitude = source.longitude;
    newNote.noteLocation = newNoteLocation;
    newNoteLocation.note = newNote;
    NSError* error;
    if(![[self managedObjectContext] save: &error]) {
        NSLog(AGVSaveError, [error localizedDescription]);
    }
}

- (IBAction) cancelNote: (UIStoryboardSegue*) segue {
    
}

- (IBAction) edit {
    if([self.tableView isEditing]){
        [self.tableView setEditing: NO animated: YES];
    }else{
        [self.tableView setEditing: YES animated: YES];
    }
    
}

#pragma mark - UITableViewDataSource methods

- (UITableViewCell*) tableView: (UITableView*) tableView cellForRowAtIndexPath: (NSIndexPath*) indexPath {
    NoteCell* cell = (NoteCell*)[self.tableView dequeueReusableCellWithIdentifier: AGVCellIdentifier];
    
    if(!cell){
        cell = [[NoteCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: AGVCellIdentifier];
    }
    
    [self configureCell: cell atIndexPath: indexPath];
        
    return cell;
}

- (NSInteger) numberOfSectionsInTableView: (UITableView*) tableView {
    return 1;
}

- (NSInteger) tableView: (UITableView*) tableView numberOfRowsInSection: (NSInteger) section {
    id sectionInfo = [[_fetchedResultsController sections] objectAtIndex: section];
    return [sectionInfo numberOfObjects];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
		NSManagedObjectContext* context = [self managedObjectContext];
        [context deleteObject: [[self fetchedResultsController] objectAtIndexPath: indexPath]];
        NSError* error;
        if(![context save: &error]){
            NSLog(AGVSaveError, [error localizedDescription]);
            exit(-1);
        }
    }
}


#pragma mark - Segue

- (void) prepareForSegue: (UIStoryboardSegue*) segue sender: (id) sender {
    if([segue.identifier isEqualToString:@"noteDetailsSegue"] || [segue.identifier isEqualToString:@"detailNoteViewSegue"]){
        NSLog(@"segue happened");
        AGVNoteDetailViewController* destination = segue.destinationViewController;
        if([destination view]){
            Note* note = [_fetchedResultsController objectAtIndexPath: [self.tableView indexPathForSelectedRow]];
            NoteLocation* noteLocation = [note noteLocation];
            destination.noteTitle.text = [note title];
            destination.content.text = [note content];
            CLLocationDegrees lat = (CLLocationDegrees)[[noteLocation latitude] doubleValue];
            CLLocationDegrees lon = (CLLocationDegrees)[[noteLocation longitude] doubleValue];
            [destination addPinToMapAtLocation: CLLocationCoordinate2DMake(lat, lon) withName: noteLocation.locationName];
            MKCoordinateSpan span;
            span.latitudeDelta = 0.040;
            span.longitudeDelta = 0.040;
            MKCoordinateRegion region;
            region.span = span;
            region.center = CLLocationCoordinate2DMake(lat, lon);
            [destination.map setRegion: region animated: YES];
        }
    }
}



- (NSFetchedResultsController*) fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        NSLog(@"_fetchedResultsController is already instantiated");
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName: AGVEntityName inManagedObjectContext: _managedObjectContext];
    [fetchRequest setEntity: entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey: @"timestamp" ascending: NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject: sort]];
    
    [fetchRequest setFetchBatchSize: 20];
    
    NSFetchedResultsController *theFetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:_managedObjectContext sectionNameKeyPath: nil cacheName: @"Root"];
    self.fetchedResultsController = theFetchedResultsController;
    _fetchedResultsController.delegate = self;
    NSLog(@"_fetchedResultsController instantiated");
    return _fetchedResultsController;
    
}



#pragma mark - NSFetchedResultsControllerDelegate methods

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}


- (void) controller: (NSFetchedResultsController*) controller didChangeObject:(id) anObject atIndexPath: (NSIndexPath*) indexPath forChangeType:(NSFetchedResultsChangeType) type newIndexPath: (NSIndexPath*) newIndexPath {
    
    UITableView *tableView = self.tableView;
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell: (NoteCell*)[self.tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id )sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    
    switch(type) {
            
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (void)configureCell: (NoteCell*) cell atIndexPath:(NSIndexPath *)indexPath {
    Note* note = [_fetchedResultsController objectAtIndexPath: indexPath];
    cell.textLabel.text = note.title;
    
}

#pragma mark - AGVNewNoteLocationViewControllerDelegate methods

- (NSManagedObjectContext*) getContext {
    return _managedObjectContext;
}

@end
//
//  AGVNewNoteContentViewController.m
//  Notes
//
//  Created by Alex on 3/7/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "AGVNewNoteContentViewController.h"

@implementation AGVNewNoteContentViewController

- (void) prepareForSegue: (UIStoryboardSegue*) segue sender: (id) sender {
    if([segue.identifier isEqualToString:@"newNoteLocationSegue"]){
        AGVNewNoteLocationViewController* destination = segue.destinationViewController;
        if([destination view]){
            destination.noteToBeSaved.title = self.noteTitle.text;
            destination.noteToBeSaved.content = self.noteContent.text;
        }
    }
}


@end

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
    NSLog(@"segue from content controller");
    if([segue.identifier isEqualToString:@"newNoteLocationSegue"]){
        AGVNewNoteLocationViewController* destination = segue.destinationViewController;
        if([destination view]){
            NSLog(@"In conditional");
            destination.noteTitle = self.noteTitle.text;
            destination.noteContent = self.noteContent.text;
        }
    }
}


@end

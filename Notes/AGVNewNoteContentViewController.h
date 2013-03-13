//
//  AGVNewNoteContentViewController.h
//  Notes
//
//  Created by Alex on 3/7/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AGVNewNoteLocationViewController.h"
#import "Note.h"


@interface AGVNewNoteContentViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField* noteTitle;
@property (strong, nonatomic) IBOutlet UITextView* noteContent;

# pragma mark - Segue
- (void) prepareForSegue: (UIStoryboardSegue*) segue sender: (id) sender;

@end

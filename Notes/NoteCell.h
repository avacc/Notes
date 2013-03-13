//
//  NoteCell.h
//  Notes
//
//  Created by Alex on 3/7/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Note.h"


@interface NoteCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel* title;
@property (strong, nonatomic) Note* associatedNote;

- (void) associateNote: (Note*) note;

@end

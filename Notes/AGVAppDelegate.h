//
//  AGVAppDelegate.h
//  Notes
//
//  Created by Alex on 3/1/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGVNotesViewController.h"

@interface AGVAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;
@property (strong, nonatomic) NSPersistentStoreCoordinator* persistentStoreCoordinator;
@property (strong, nonatomic) NSManagedObjectModel* managedObjectModel;

@end

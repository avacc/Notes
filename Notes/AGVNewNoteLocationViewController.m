//
//  AGVNewNoteLocationViewController.m
//  Notes
//
//  Created by Alex on 3/7/13.
//  Copyright (c) 2013 Alex. All rights reserved.
//

#import "AGVNewNoteLocationViewController.h"


@implementation AGVNewNoteLocationViewController


-(id) init {
    self = [super init];
    if(self){
    }
    return self;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    UILongPressGestureRecognizer* longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget: self.map action:@selector(respondToLongPress:)];
    longPressRecognizer.minimumPressDuration = 1.5;
    longPressRecognizer.numberOfTouchesRequired = 1;
    [self.map addGestureRecognizer: longPressRecognizer];
}

- (void) addPinToMapAtLocation: (CLLocationCoordinate2D) location{
    if([[self.map annotations]count] != 0){
        [self.map removeAnnotations:[self.map annotations]];
    }
    MKPointAnnotation* pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = location;
    UIAlertView* prompt = [[UIAlertView alloc] initWithTitle: @"Location Name" message: @"Enter name of location:" delegate: self cancelButtonTitle: @"Cancel" otherButtonTitles:@"Done", nil];
    prompt.alertViewStyle = UIAlertViewStylePlainTextInput;
    [prompt show];
    prompt.delegate = self;
    [self.map addAnnotation: pin];
    [self.map setCenterCoordinate: pin.coordinate animated: YES];
    NSString* lat = [NSString stringWithFormat: @"%f", pin.coordinate.latitude];
    NSString* lon = [NSString stringWithFormat: @"%f", pin.coordinate.longitude];
    self.latitude = lat;
    self.longitude = lon;
}



- (IBAction) respondToLongPress: (UILongPressGestureRecognizer*) longPressRecognizer{
    NSLog(@"Responded to long press");
    if(longPressRecognizer.state != UIGestureRecognizerStateEnded){
        return;
    }
    CGPoint longPressLocation = [longPressRecognizer locationInView: self.map];
    CLLocationCoordinate2D longPressCoordinate = [self.map convertPoint: longPressLocation toCoordinateFromView: self.map];
    [self addPinToMapAtLocation: longPressCoordinate];
}

#pragma mark - UIAlertViewDelegate methods
- (void) alertView: (UIAlertView*) alertView clickedButtonAtIndex: (NSInteger) buttonIndex {
    if (buttonIndex != 0) {
        for(UIView* view in alertView.subviews){
            if([view isKindOfClass: [UITextField class]]){
                UITextField* locationName = (UITextField*) view;
                self.locationName = locationName.text;
                //NoteLocation* newNoteLocation = [self noteLocationToBeSaved];
                //newNoteLocation.locationName = locationName.text;
                [alertView dismissWithClickedButtonIndex: 0 animated: YES];
                break;
            }
        }
    }
}

#pragma mark - Segue

- (void) prepareForSegue: (UIStoryboardSegue*) segue sender: (id) sender {
    
}
@end

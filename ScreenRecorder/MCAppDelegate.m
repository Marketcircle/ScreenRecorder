//
//  MCAppDelegate.m
//  ScreenRecorder
//
//  Created by Mark Rada on 12-03-30.
//  Copyright (c) 2012 Marketcircle Incorporated. All rights reserved.
//

#import "MCAppDelegate.h"

@implementation MCAppDelegate

@synthesize recorder;
@synthesize recorderMenu;
@synthesize startStopButton;
@synthesize pauseUnpauseButton;
@synthesize menuSeparator;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  self.recorder = [[MCScreenRecorder alloc] init];
  [recorderMenu setAutoenablesItems:NO];
}

- (IBAction)startStopRecording:(id)sender {
  if (self.recorder.session.running) {
    [self.recorder stop];

    // Update UI
    [startStopButton setTitle:@"Start"];
    [pauseUnpauseButton setEnabled:NO];

  } else {
    [self.recorder start];

    // Update UI
    [startStopButton setTitle:@"Stop"];
    [pauseUnpauseButton setEnabled:YES];
    [menuSeparator setHidden:NO];

    // Add a menu item for the new recording
    [recorderMenu addItem:[[MCScreenRecordingMenuItem alloc] 
                           initWithFile:self.recorder.file]];
  }

  // We always want to reset the title
  [pauseUnpauseButton setTitle:@"Pause"];
}

- (IBAction)pauseUnpauseRecording:(id)sender {
  if ([self.recorder toggle])
    [pauseUnpauseButton setTitle:@"Pause"];
  else
    [pauseUnpauseButton setTitle:@"Resume"];
}

@end

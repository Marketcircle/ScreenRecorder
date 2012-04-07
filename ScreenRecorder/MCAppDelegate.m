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
@synthesize toggleButton;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  self.recorder = [[MCScreenRecorder alloc] init];
}

- (IBAction)startRecording:(id)sender {
  [self.recorder start];
}

- (IBAction)pauseRecording:(id)sender {
  if ([self.recorder toggle])
    [toggleButton setTitle:@"Pause"];
  else
    [toggleButton setTitle:@"Resume"];
}

- (IBAction)stopRecording:(id)sender {
  [self.recorder stop];
}

@end

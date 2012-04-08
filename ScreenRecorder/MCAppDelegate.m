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
@synthesize menuSeparator;
@synthesize fileButton;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
  self.recorder = [[MCScreenRecorder alloc] init];
}

- (IBAction)startRecording:(id)sender {
  [self.recorder start];

  [menuSeparator setHidden:NO];

  [fileButton setTitle:[self.recorder.file lastPathComponent]];
  // rdar://11207662 documentation claims to allow URLs, but only takes strings
  [fileButton accessibilitySetOverrideValue:[self.recorder.file absoluteString]
                               forAttribute:NSAccessibilityURLAttribute];
  [fileButton setHidden:NO];
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

- (IBAction)showInFinder:(id)sender {
  [[NSWorkspace sharedWorkspace] activateFileViewerSelectingURLs:[NSArray arrayWithObject:self.recorder.file]];
}

@end

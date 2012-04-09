//
//  MCScreenRecordingMenuItem.m
//  ScreenRecorder
//
//  Created by Mark Rada on 12-04-08.
//  Copyright (c) 2012 Marketcircle Incorporated. All rights reserved.
//

#import "MCScreenRecordingMenuItem.h"

@implementation MCScreenRecordingMenuItem

@synthesize file;

- (id)initWithFile:(NSURL*)url {
  self.file = url;

  [self setTitle:[url lastPathComponent]];
  // rdar://11207662 documentation claims to allow URLs, but only takes strings
  [self accessibilitySetOverrideValue:[url absoluteString]
                         forAttribute:NSAccessibilityURLAttribute];

  [self setTarget:self];
  [self setAction:@selector(showInFinder:)];

  return self;
}

- (IBAction)showInFinder:(id)sender {
  [[NSWorkspace sharedWorkspace] activateFileViewerSelectingURLs:
   [NSArray arrayWithObject:self.file]];
}

@end

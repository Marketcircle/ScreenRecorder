//
//  MCAppDelegate.h
//  ScreenRecorder
//
//  Created by Mark Rada on 12-03-30.
//  Copyright (c) 2012 Marketcircle Incorporated. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MCScreenRecorder.h"
#import "MCScreenRecordingMenuItem.h"

@interface MCAppDelegate : NSObject <NSApplicationDelegate>

@property (retain) MCScreenRecorder* recorder;
@property (weak) IBOutlet NSMenu *recorderMenu;
@property (weak) IBOutlet NSMenuItem *startStopButton;
@property (weak) IBOutlet NSMenuItem *pauseUnpauseButton;
@property (weak) IBOutlet NSMenuItem *menuSeparator;

- (IBAction)startStopRecording:(id)sender;
- (IBAction)pauseUnpauseRecording:(id)sender;

@end

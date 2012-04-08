//
//  MCScreenRecordingMenuItem.h
//  ScreenRecorder
//
//  Created by Mark Rada on 12-04-08.
//  Copyright (c) 2012 Marketcircle Incorporated. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MCScreenRecordingMenuItem : NSMenuItem

@property (retain) NSURL* file;

- (id)initWithFile:(NSURL*)url;
- (IBAction)showInFinder:(id)sender;

@end

//
//  MCScreenRecorder.m
//  ScreenRecorder
//
//  Created by Mark Rada on 12-04-07.
//  Copyright (c) 2012 Marketcircle Incorporated. All rights reserved.
//

#import "MCScreenRecorder.h"

@implementation MCScreenRecorder

@synthesize session;
@synthesize input;
@synthesize output;

- (id) init {
  self.session = [[AVCaptureSession alloc] init];
  
  self.input   = [[AVCaptureScreenInput alloc] 
                      initWithDisplayID:CGMainDisplayID()];
  
  self.input.capturesMouseClicks = YES;
  [self.session addInput:self.input];
  
  self.output = [[AVCaptureMovieFileOutput alloc] init];
  // @todo We may need to set a different compression preset
  [self.output setDelegate:self];
  [self.session addOutput:self.output];
    
  return self;
}

- (BOOL) start {
  return YES;
}

- (BOOL) pause {
  return YES;
}

- (BOOL) stop {
  return YES;
}


- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
  
}


@end

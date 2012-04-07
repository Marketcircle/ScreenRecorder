//
//  MCScreenRecorder.h
//  ScreenRecorder
//
//  Created by Mark Rada on 12-04-07.
//  Copyright (c) 2012 Marketcircle Incorporated. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface MCScreenRecorder : NSObject <AVCaptureFileOutputDelegate>

@property (retain) AVCaptureSession* session;
@property (retain) AVCaptureScreenInput* input;
@property (retain) AVCaptureMovieFileOutput* output;

- (BOOL) start;
- (BOOL) pause;
- (BOOL) stop;

#pragma mark AVCaptureFileOutputDelegate

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection;

@end

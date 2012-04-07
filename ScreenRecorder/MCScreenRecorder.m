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
@synthesize file;

- (id) init {
  self.session = [[AVCaptureSession alloc] init];
  self.session.sessionPreset = AVCaptureSessionPreset1280x720;

  self.input   = [[AVCaptureScreenInput alloc] initWithDisplayID:CGMainDisplayID()];
  self.input.capturesMouseClicks = YES;

  self.output  = [[AVCaptureMovieFileOutput alloc] init];
  [self.output setDelegate:self];

  [self.session addInput:self.input];
  [self.session addOutput:self.output];

  return self;
}

- (BOOL) start {
  static NSDateFormatter* formatter;
  static NSURL*           homeDir;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYYMMDDHHmmss"];

    homeDir = [NSURL fileURLWithPath:[@"~/Movies/" stringByExpandingTildeInPath]];
  });

  NSString* date = [formatter stringFromDate:[NSDate date]];
  self.file      = [[homeDir URLByAppendingPathComponent:[@"TestRecording-" stringByAppendingString:date]] URLByAppendingPathExtension:@"mov"];

  [self.session startRunning];
  [self.output  startRecordingToOutputFileURL:self.file
                            recordingDelegate:self];

  return YES;
}

- (BOOL) pause {
  if (self.output.recordingPaused)
    [self.output resumeRecording];
  else
    [self.output pauseRecording];

  return YES;
}

- (BOOL) stop {
  [self.session stopRunning];
  [self.output  stopRecording];
  return YES;
}


#pragma mark AVCaptureFileOutputDelegate

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
}


#pragma mark AVCaptureFileOutputRecordingDelegate

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL fromConnections:(NSArray *)connections error:(NSError *)error {
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didPauseRecordingToOutputFileAtURL:(NSURL *)fileURL fromConnections:(NSArray *)connections {
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didResumeRecordingToOutputFileAtURL:(NSURL *)fileURL fromConnections:(NSArray *)connections {
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didStartRecordingToOutputFileAtURL:(NSURL *)fileURL fromConnections:(NSArray *)connections {
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput willFinishRecordingToOutputFileAtURL:(NSURL *)fileURL fromConnections:(NSArray *)connections error:(NSError *)error {
}

@end























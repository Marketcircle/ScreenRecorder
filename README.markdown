# Screen Recorder

A simple app to act as a proxy to the screen recording APIs in
AVFoundation. I would have done this in MacRuby, but AVFoundation does
not work with garbage collection on OS X 10.7.

There is not much to see here, but the goal will be a simple app, just
some menus, so that screen recordings can be easily started,
stopped, or paused.

## Usage

Clone and build. There are no external dependencies, you only need a
version of XCode that includes Clang with ARC functionality.

When you run the app there will be no windows. You can start a new
recording from the menu bar using `Recorder > Start` and then stop the
recording using `Recorder > Stop`. If you need to pause the recording
then you can also use `Recorder > Pause` and `Recorder > Resume`.

The screen recording will be saved to `~/Movies` and the file name will
be shown in the `Recorder` after a recording has started. Selecting the
file from the menu will show the file in the Finder.

## License

Screen Recorder is released under the MIT license: http://www.opensource.org/licenses/MIT

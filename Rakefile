desc "Build the project"
task :build do
  puts `xcodebuild`
end

desc "Install the project to /Applications"
task :install => :build do
  FileUtils.rm_rf "/Applications/ScreenRecorder.app"
  FileUtils.mv "build/Release/ScreenRecorder.app", "/Applications/ScreenRecorder.app"
end


dir_watch.dll is a multithreaded dll that can watch multiple directories
for changes.

Communication done across threads is handled by the Windows message
que. Receivers must subclass their main window watching for messages.


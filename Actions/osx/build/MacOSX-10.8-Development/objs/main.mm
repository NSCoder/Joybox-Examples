#import <AppKit/AppKit.h>

extern "C" {
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
    void RubyMotionInit(int argc, char **argv);
}
int
main(int argc, char **argv)
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
#if !__LP64__
    try {
#endif
        RubyMotionInit(argc, argv);
        rb_define_global_const("RUBYMOTION_ENV", @"development");
rb_define_global_const("RUBYMOTION_VERSION", @"2.0");

        NSApplication *app = [NSApplication sharedApplication];
        [app setDelegate:[NSClassFromString(@"AppDelegate") new]];
        NSApplicationMain(argc, (const char **)argv);
        rb_exit(0);
#if !__LP64__
    }
    catch (...) {
	rb_rb2oc_exc_handler();
    }
#endif
    [pool release];
    return 0;
}

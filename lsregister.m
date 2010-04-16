#import "LSApplicationWorkspace.h"

int main(int argc, char **argv, char **envp) {
	if(argc < 2) {
		fprintf(stderr, "Syntax: %s path\n", argv[0]);
		return 1;
	}
	NSAutoreleasePool *p = [[NSAutoreleasePool alloc] init];
	SEL selector = @selector(registerApplication:);
	if(strcmp(argv[0], "lsunregister") == 0)
		selector = @selector(unregisterApplication:);

	NSString *path = [[NSString stringWithUTF8String:argv[1]] stringByStandardizingPath];
	BOOL ret = (int)[[LSApplicationWorkspace defaultWorkspace] performSelector:selector withObject:[NSURL fileURLWithPath:path]];
	[p drain];
	return !ret; // retval 0 = success.
}

// vim:ft=objc

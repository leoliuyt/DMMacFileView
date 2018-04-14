//
//  AppDelegate.m
//  DMMacFileView
//
//  Created by lbq on 2018/4/14.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "AppDelegate.h"
#import "DMMainWindowController.h"

@interface AppDelegate ()

@property (strong) NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    DMMainWindowController *windowController = [[DMMainWindowController alloc] init];
    [windowController showWindow:self];
    
    NSMenu *mainMenu = [[NSMenu alloc] initWithTitle:@"AAA"];
    [NSApplication sharedApplication].mainMenu = mainMenu;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end

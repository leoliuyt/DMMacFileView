//
//  AppDelegate.m
//  DMMacFileView
//
//  Created by lbq on 2018/4/14.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "AppDelegate.h"
#import "DMMainWindowController.h"
#import "DMRootViewController.h"

@interface AppDelegate ()

@property (strong) DMMainWindowController *windowController;
@property (strong) NSWindow  *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    DMMainWindowController *windowController = [[DMMainWindowController alloc] init];
    [windowController showWindow:self];
    self.windowController = windowController;
    
//    DMRootViewController *vc = [[DMRootViewController alloc] initWithNibName:@"DMRootViewController" bundle:nil];
//    self.window = [NSWindow windowWithContentViewController:vc];
//     [self.window makeKeyAndOrderFront:nil];
    
    NSMenu *mainMenu = [[NSMenu alloc] initWithTitle:@"AAA"];
    
    NSMenuItem *fileViewMenuItem = [[NSMenuItem alloc] initWithTitle:@"设置名称无用默认-DMMacFileView" action:nil keyEquivalent:@""];
    
    [mainMenu addItem:fileViewMenuItem];
    
    NSMenu *fileViewMenu = [[NSMenu alloc] initWithTitle:@"DMMacFileView"];
    NSMenuItem *openMenu = [[NSMenuItem alloc] initWithTitle:@"open" action:@selector(openDocument:) keyEquivalent:@"o"];
    openMenu.enabled = YES;
    [fileViewMenu addItem:openMenu];
    
    [mainMenu setSubmenu:fileViewMenu forItem:fileViewMenuItem];
    
    [NSApplication sharedApplication].mainMenu = mainMenu;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)openDocument:(id)sender
{
//    NSDocumentController *controller = [NSDocumentController sharedDocumentController];
//    [controller openDocument:nil];
    NSOpenPanel *openPanel = [[NSOpenPanel alloc] init];
    openPanel.showsHiddenFiles = NO;
    openPanel.canChooseFiles = NO;
    openPanel.canChooseDirectories = YES;
    __weak typeof(self) weakSelf = self;
    [openPanel beginSheetModalForWindow:self.windowController.window completionHandler:^(NSModalResponse returnCode) {
        if (returnCode != NSModalResponseOK) {
            return ;
        }
        weakSelf.windowController.contentViewController.representedObject = openPanel.URL;
    }];
}
@end

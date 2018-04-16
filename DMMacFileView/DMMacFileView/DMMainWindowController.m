//
//  DMMainWindowController.m
//  DMMacFileView
//
//  Created by lbq on 2018/4/14.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "DMMainWindowController.h"
#import "DMRootViewController.h"
#import "DMXibRootViewController.h"
#import <Masonry.h>
@interface DMMainWindowController ()

@end

@implementation DMMainWindowController

- (instancetype)init
{
    DMRootViewController *vc = [[DMRootViewController alloc] init];
//    DMXibRootViewController *vc = [[DMXibRootViewController alloc] initWithNibName:@"DMXibRootViewController" bundle:nil];
    NSWindow *window = [NSWindow windowWithContentViewController:vc];
    
    NSLog(@"-----");
    
    //resize 时 宽高的变换单元
//    [window setResizeIncrements:CGSizeMake(80, 60)];
    
    //始终按照比例缩放
    window.aspectRatio = CGSizeMake(4, 3);
    window.minSize = CGSizeMake(400, 300);
    window.maxSize = CGSizeMake(800, 600);
    //是指初始显示大小
    [window setFrame:CGRectMake(0, 0, 800, 600) display:YES];
    [window setTitle:@"主Window"];
    [window center];
    [window becomeKeyWindow];
    [window becomeMainWindow];
    return [super initWithWindow:window];
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end

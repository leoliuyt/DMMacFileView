//
//  main.m
//  DMMacFileView
//
//  Created by lbq on 2018/4/14.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

int main(int argc, const char * argv[]) {
    id delegate = [[AppDelegate alloc] init];
    [NSApplication sharedApplication].delegate = delegate;
    return NSApplicationMain(argc, argv);
}

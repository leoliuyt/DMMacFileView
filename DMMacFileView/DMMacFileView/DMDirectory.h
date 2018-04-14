//
//  DMDirectory.h
//  DMMacFileView
//
//  Created by lbq on 2018/4/14.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@class DMMetadata;
@interface DMDirectory : NSObject

@property (nonatomic, strong) NSArray<DMMetadata *> *files;

- (instancetype)initWithFolderURL:(NSURL *)aUrl;

@end


@interface DMMetadata : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, assign) NSInteger size;
@property (nonatomic, strong) NSImage *icon;
@property (nonatomic, strong) NSColor *color;
@property (nonatomic, assign) BOOL isFolder;
@property (nonatomic, strong) NSURL *url;
- (instancetype)initFileUrl:(NSURL *)aUrl name:(NSString *)aName date:(NSDate *)aDate size:(NSInteger)aSize icon:(NSImage *)aImage isFolder:(BOOL)isFolder color:(NSColor *)aColor;
@end

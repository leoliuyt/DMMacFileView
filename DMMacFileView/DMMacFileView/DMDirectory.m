//
//  DMDirectory.m
//  DMMacFileView
//
//  Created by lbq on 2018/4/14.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "DMDirectory.h"
@interface DMDirectory()
@property (nonatomic, strong) NSURL *url;
@end
@implementation DMDirectory

- (instancetype)initWithFolderURL:(NSURL *)aUrl
{
    DMDirectory *dic = [[DMDirectory alloc] init];
    dic.url = aUrl;
    NSMutableArray *fileList = [NSMutableArray array];
    NSArray *resourceKeys = @[NSURLLocalizedNameKey,NSURLEffectiveIconKey,NSURLTypeIdentifierKey,NSURLContentModificationDateKey,NSURLFileSizeKey,NSURLIsDirectoryKey,NSURLIsPackageKey];
    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager]
                                         enumeratorAtURL:aUrl
                         includingPropertiesForKeys:resourceKeys
                                            options:NSDirectoryEnumerationSkipsHiddenFiles|NSDirectoryEnumerationSkipsPackageDescendants|NSDirectoryEnumerationSkipsSubdirectoryDescendants
                                         errorHandler:nil];
    NSURL *tmpUrl = nil;
    while (tmpUrl = [enumerator nextObject]) {
        NSError *error;
        NSDictionary *properties = [tmpUrl resourceValuesForKeys:resourceKeys error:&error];
        if (!error) {
            DMMetadata *metadata = [[DMMetadata alloc] init];
            metadata.url = tmpUrl;
            metadata.name = properties[NSURLLocalizedNameKey] ?: @"";
            metadata.date = properties[NSURLContentModificationDateKey] ?: NSDate.distantPast;
            metadata.size = [properties[NSURLFileSizeKey] integerValue]?: 0;
            metadata.icon = properties[NSURLEffectiveIconKey] ?: [NSImage new];
            metadata.isFolder = [properties[NSURLIsDirectoryKey] boolValue] ?: NO;
            metadata.color = [NSColor new];
            [fileList addObject:metadata];
        }
    }
    dic.files = [fileList mutableCopy];
    return dic;
}
@end

@implementation DMMetadata

- (instancetype)initFileUrl:(NSURL *)aUrl name:(NSString *)aName date:(NSDate *)aDate size:(NSInteger)aSize icon:(NSImage *)aImage isFolder:(BOOL)isFolder color:(NSColor *)aColor
{
    DMMetadata *metadata = [DMMetadata new];
    metadata.url = aUrl;
    metadata.name = aName;
    metadata.date = aDate;
    metadata.size = aSize;
    metadata.icon = aImage;
    metadata.isFolder = isFolder;
    metadata.color = aColor;
    return metadata;
}
@end

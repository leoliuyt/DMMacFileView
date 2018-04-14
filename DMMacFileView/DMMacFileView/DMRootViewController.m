//
//  DMRootViewController.m
//  DMMacFileView
//
//  Created by lbq on 2018/4/14.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "DMRootViewController.h"
#import <Masonry.h>
@interface DMRootViewController ()<NSTableViewDelegate,NSTableViewDataSource>

@property (nonatomic, strong) NSTableView *tableView;

@end

@implementation DMRootViewController

- (void)loadView
{
    self.view = [[NSView alloc] initWithFrame:CGRectMake(0, 0, 800, 600)];//1280*800
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor orangeColor].CGColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

//MARK: NSTableViewDelegate


//MARK: NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return 10;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row
{
    return nil;
}

@end

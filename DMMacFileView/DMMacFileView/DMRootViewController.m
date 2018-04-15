//
//  DMRootViewController.m
//  DMMacFileView
//
//  Created by lbq on 2018/4/14.
//  Copyright © 2018年 lbq. All rights reserved.
//

#import "DMRootViewController.h"
#import <Masonry.h>
#import "DMDirectory.h"
#import "DMNameCellView.h"

@interface DMRootViewController ()<NSTableViewDelegate,NSTableViewDataSource>

@property (nonatomic, strong) NSTableView *tableView;

@property (nonatomic, strong) DMDirectory *directory;

@property (nonatomic, strong) NSArray<DMMetadata *> *directoryItems;

@end

@implementation DMRootViewController

- (void)loadView
{
    self.view = [[NSView alloc] initWithFrame:CGRectMake(0, 0, 800, 600)];//1280*800
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = [NSColor orangeColor].CGColor;
    
//    self.tableView = [[NSTableView alloc] initWithFrame:CGRectMake(0, 0, 800, 600)];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    self.tableView = [[NSTableView alloc] initWithFrame:CGRectMake(0, 0, 800, 600)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    NSTableColumn * nameColumn = [[NSTableColumn alloc]initWithIdentifier:@"NameCell"];
    nameColumn.title = @"name";
    nameColumn.width = 800. / 3.;
    [self.tableView addTableColumn:nameColumn];
    
    NSTableColumn * dateColumn = [[NSTableColumn alloc]initWithIdentifier:@"DateCell"];
    dateColumn.title = @"date";
    dateColumn.width = 800. / 3.;
    [self.tableView addTableColumn:dateColumn];
    
    NSTableColumn * sizeColumn = [[NSTableColumn alloc]initWithIdentifier:@"SizeCell"];
    sizeColumn.title = @"size";
    sizeColumn.width = 800. / 3.;
    [self.tableView addTableColumn:sizeColumn];
    
    
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:@"DMNameCellView" bundle:nil] forIdentifier:@"NameCell"];
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:@"DMDateCellView" bundle:nil] forIdentifier:@"DateCell"];
    [self.tableView registerNib:[[NSNib alloc] initWithNibNamed:@"DMSizeCellView" bundle:nil] forIdentifier:@"SizeCell"];
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
}

- (void)setRepresentedObject:(id)representedObject
{
    NSURL *url = (NSURL *)representedObject;
    self.directory = [[DMDirectory alloc] initWithFolderURL:url];
    [self reloadFileList];
}

- (void)reloadFileList
{
    self.directoryItems = self.directory.files;
    [self.tableView reloadData];
}

//MARK: NSTableViewDelegate
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    DMMetadata *item = self.directoryItems[row];
    
    NSImage *image;
    NSString *text = @"";
    NSString *cellIdentifier = @"";
    if (tableColumn == tableView.tableColumns[0]) {
        image = item.icon;
        text = item.name;
        cellIdentifier = @"NameCell";
    } else if (tableColumn == tableView.tableColumns[1]){
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        text = [dateFormatter stringFromDate:item.date];
        cellIdentifier = @"DateCell";
    } else if (tableColumn == tableView.tableColumns[2]) {
        NSByteCountFormatter *bytCountFormatter = [[NSByteCountFormatter alloc] init];
        text = item.isFolder ? @"--" : [bytCountFormatter stringFromByteCount:item.size];
        cellIdentifier = @"SizeCell";
    }
    NSTableCellView *cell = [tableView makeViewWithIdentifier:cellIdentifier owner:nil];
    cell.textField.stringValue = text;
    cell.imageView.image = image ? image : nil;
    return cell;
}

//MARK: NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return self.directoryItems.count;
}

- (nullable id)tableView:(NSTableView *)tableView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row
{
    return self.directoryItems[row];
}

@end

//
//  ObjcViewController.m
//  PullToRefreshDemo
//
//  Created by Nikolay Derkach on 3/27/17.
//  Copyright © 2017 Blipme. All rights reserved.
//

#import <UIKit/UIKit.h>
@import PullToRefresh;
#import "PullToRefreshDemo-Swift.h"

static const NSUInteger kPageSize = 20;

@interface CustomObjcViewController: UIViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSUInteger dataSourceCount;

@end

@implementation CustomObjcViewController

- (void) viewDidLoad {
    [super viewDidLoad];

    [self setupPullToRefresh];
}

- (void)dealloc {
    [self.tableView removeAllPullToRefresh];
}

- (void) setupPullToRefresh {

    AwesomePullToRefresh *refreshControl = [[AwesomePullToRefresh alloc] initWithBackgroundColor:[UIColor redColor]];

    [self.tableView addPullToRefresh:refreshControl action:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            self.dataSourceCount = kPageSize;
            [self.tableView reloadData];
            [self.tableView endRefreshingAtTop];
        });
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    return cell;
}

- (IBAction)startRefreshing:(id)sender {
    [self.tableView startRefreshingAtTop];
}

@end



//
//  TableViewController.m
//  testProject
//
//  Created by 王益 on 15/3/30.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "TableViewController.h"
#import "WebViewController.h"

@interface TableViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = @"点我有惊喜";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WebViewController *vc = [[WebViewController alloc] init];
    vc.urlString = @"http://www.qiushibaike.com";
    [self presentViewController:vc animated:YES completion:nil];
}

@end

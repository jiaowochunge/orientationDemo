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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
#if 1
    WebViewController *vc = [[WebViewController alloc] init];
    vc.urlString = @"http://www.qiushibaike.com";
    [self presentViewController:vc animated:YES completion:nil];
#else
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc]init];
    pickerVC.delegate = self;
    pickerVC.allowsEditing = YES;
    pickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:pickerVC animated:YES completion:nil];
#endif
}

@end

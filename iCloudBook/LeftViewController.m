//
//  LeftViewController.m
//  iCloudBook
//
//  Created by MasterFan on 16/2/21.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import "LeftViewController.h"
#import "AboutViewController.h"
#import "SettingsViewController.h"
#import "RESideMenu.h"

static NSString * const kYCLeftViewControllerCellReuseId = @"kYCLeftViewControllerCellReuseId";

@interface LeftViewController ()

@property (nonatomic, strong) NSArray *lefs;
@property (nonatomic, assign) NSInteger previousRow;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lefs = @[@"Home", @"软件设置", @"关于我们"];
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.width - 64);
    _tableView.dataSource = self;
    _tableView.delegate   = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kYCLeftViewControllerCellReuseId];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.lefs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kYCLeftViewControllerCellReuseId forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kYCLeftViewControllerCellReuseId];
    }
    //    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.lefs[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20.0];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.highlightedTextColor = [UIColor grayColor];
    cell.selectedBackgroundView = [[UIView alloc] init];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    UIViewController *center;
    if (indexPath.row == 0) {
        center = self.sideMenuViewController.mainController;
    }else if(indexPath.row == 1){
        AboutViewController* about = [[AboutViewController alloc] initWithNibName:@"AboutViewController" bundle:nil];
        center = [[UINavigationController alloc] initWithRootViewController:about];
    }else if(indexPath.row == 2){
        SettingsViewController *setting = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:nil];
        center = [[UINavigationController alloc] initWithRootViewController:setting];
        
    }
    [self.sideMenuViewController setContentViewController:center
                                                 animated:YES];
    [self.sideMenuViewController hideMenuViewController];
    
    self.previousRow = indexPath.row;
    
}

@end

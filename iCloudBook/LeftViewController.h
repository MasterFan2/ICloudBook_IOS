//
//  LeftViewController.h
//  iCloudBook
//
//  Created by MasterFan on 16/2/21.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewController : UITabBarController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

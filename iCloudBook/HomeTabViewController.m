//
//  HomeTabViewController.m
//  iCloudBook
//
//  Created by MasterFan on 16/2/21.
//  Copyright © 2016年 MasterFan. All rights reserved.
//

#import "HomeTabViewController.h"

@interface HomeTabViewController ()

@end

@implementation HomeTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    IndexHomeViewController *indexHomeVc = [[IndexHomeViewController alloc] initWithNibName:@"IndexHomeViewController" bundle:nil];
    [self addChildVC:indexHomeVc withTitle:@"Home" withImage:@"one_icon" withSelectedImage:@"one_icon_sel"];
    CoursewareViewController *CoursewareVc = [[CoursewareViewController alloc] initWithNibName:@"CoursewareViewController" bundle:nil];
    [self addChildVC:CoursewareVc withTitle:@"Courseware" withImage:@"two_icon" withSelectedImage:@"two_icon_sel"];
    ManagementViewController* managementVc = [[ManagementViewController alloc] initWithNibName:@"ManagementViewController" bundle:nil];
    [self addChildVC:managementVc withTitle:@"Management" withImage:@"three_icon" withSelectedImage:@"three_icon_sel"];
    PersonalViewController* personalVc= [[PersonalViewController alloc] initWithNibName:@"PersonalViewController" bundle:nil];
    
    [self addChildVC:personalVc withTitle:@"personal" withImage:@"four_icon" withSelectedImage:@"four_icon_sel"];
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

-(void) addChildVC:(UIViewController *) childVc withTitle:(NSString *) title withImage:(NSString*) img withSelectedImage:(NSString * ) selectedImg {
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:img];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSMutableDictionary * textAttrs = [NSMutableDictionary dictionary];
    NSMutableDictionary * selectTextAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor greenColor];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor purpleColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

@end

//
//  JZProfileController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/11/30.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZProfileController.h"
#import "JZPictureCell.h"
#import "JZButtonsCell.h"
#import "JZDefaultCell.h"
#import "JZPublicController.h"
#import "JZUserViewController.h"
#import "TBCityIconFont.h"

@interface JZProfileController ()<UITableViewDelegate,UITableViewDataSource,JZButtonsCellDelegate>

@property (nonatomic,strong) UITableView *tableview;
@property (nonatomic,strong) NSArray *dataArr;

@end

@implementation JZProfileController

-(NSArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = @[@{@"image":@"\U0000e6cb",@"title":@"所在地修改"},
                     @{@"image":@"\U0000e66e",@"title":@"用户名修改"},
                     @{@"image":@"\U0000e617",@"title":@"QQ修改"},
                     @{@"image":@"\U0000e60e",@"title":@"密码修改"},
                     @{@"image":@"\U0000e600",@"title":@"设置"},
                     ];
    }
    return _dataArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTableView];
    
}
//设置tableVeiw
-(void)setUpTableView
{
    CGRect rect = self.view.frame;
    rect.size.height -= 49;
    self.tableview = [[UITableView alloc]initWithFrame:rect];
    self.tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableview.bounces = NO;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    [view setBackgroundColor:[UIColor colorWithRed:240/255.0 green:242/255.0 blue:245/255.0 alpha:1.0]];
    self.tableview.tableFooterView = view;
    [self.view addSubview:self.tableview];
}

#pragma mark -tableView 代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JZPictureCell *pCell = [JZPictureCell cellWithTableView:tableView];
    
    JZButtonsCell *bCell = [JZButtonsCell cellWithTableView:tableView];
    bCell.delegate = self;
    NSArray *arr = @[@"发布动态",@"我的相册",@"我的关注圈"];
    bCell.titlesArr = arr;
    
    JZDefaultCell *dCell = [JZDefaultCell cellWithTableView:tableView];
    
    if (indexPath.row == 0) {
        return pCell;
    }else if (indexPath.row == 1) {
        return bCell;
    }
    NSDictionary *dic = self.dataArr[indexPath.row-2];
    dCell.abcLab.text = dic[@"title"];
    dCell.leftImage.image = [UIImage iconWithInfo:TBCityIconInfoMake(dic[@"image"], 20, [UIColor colorWithRed:130/255.0 green:132/255.0 blue:145/255.0 alpha:1.0])];
    
    return dCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 140;
    } else if (indexPath.row == 1) {
        return 90;
    }
    return 44;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - JZButtonsCell代理
-(void)JZButtonsCellDidClick:(JZButtonsCell *)buttonsCell withIndex:(NSInteger)index
{
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.hidesBottomBarWhenPushed = YES;
    if (index == 11) {
        JZPublicController *puVC = [[JZPublicController alloc]init];
        [self.navigationController pushViewController:puVC animated:YES];
    }else if (index == 12) {
        NSLog(@"12");
    }else if (index == 13) {
        JZUserViewController *usVC = [[JZUserViewController alloc]init];
        [self.navigationController pushViewController:usVC animated:YES];
    }
    self.hidesBottomBarWhenPushed = NO;
}

@end

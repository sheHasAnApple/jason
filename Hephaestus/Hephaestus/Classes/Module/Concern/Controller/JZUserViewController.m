//
//  JZUserViewController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/20.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZUserViewController.h"
#import "JZPictureCell.h"
#import "JZButtonsCell.h"
#import "JZStatusTool.h"

#import "JZStatus.h"
#import "JZUser.h"
#import "JZStatusFrame.h"
#import "JZstatusCell.h"
#import "MJRefresh.h"

@interface JZUserViewController ()<UITableViewDelegate,UITableViewDataSource,JZButtonsCellDelegate>

@property (nonatomic ,strong) NSMutableArray *statusArr;
@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation JZUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"三胖子";
    self.view.backgroundColor = [UIColor blueColor];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    tableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(getNewStatuses)];
    
    [JZStatusTool getNewStatusWithSineceId:nil success:^(NSArray *statuses) {
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (JZStatus *status in statuses) {
            
            JZStatusFrame *statusF = [[JZStatusFrame alloc] init];
            statusF.status = status;
            [statusFrames addObject:statusF];
            NSLog(@"%lu",(unsigned long)statusFrames.count);
        }
        self.statusArr = statusFrames;
        [tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"error%@",error);
    }];
    
}

-(void)getNewStatuses
{
    [JZStatusTool getNewStatusWithSineceId:nil success:^(NSArray *statuses) {
        
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (JZStatus *status in statuses) {
            JZStatusFrame *statusF = [[JZStatusFrame alloc] init];
            statusF.status = status;
            [statusFrames addObject:statusF];
            NSLog(@"%lu",(unsigned long)statusFrames.count);
        }
        self.statusArr = statusFrames;
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"error%@",error);
    }];
}




#pragma mark - tableView代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%u",self.statusArr.count+2);
    return self.statusArr.count+2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JZPictureCell *pCell = [JZPictureCell cellWithTableView:tableView];
    
    JZButtonsCell *bCell = [JZButtonsCell cellWithTableView:tableView];
    bCell.delegate = self;
    NSArray *arr = @[@"动态",@"相册",@"QQ"];
    bCell.titlesArr = arr;

    JZstatusCell *sCell = [JZstatusCell cellWithTableView:tableView];
    
    
    
    if (indexPath.row == 0) {
        return pCell;
    } else if (indexPath.row == 1){
        return bCell;
    } else {
        sCell.statusF = self.statusArr[indexPath.row-2];
    }
    return sCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 140;
    } else if (indexPath.row == 1) {
        return 90;
    }
    JZStatusFrame *statusFrame = self.statusArr[indexPath.row-2];
    return statusFrame.cellHeight;
}

#pragma mark - 按钮点击代理
-(void)JZButtonsCellDidClick:(JZButtonsCell *)buttonsCell withIndex:(NSInteger)index
{
    
}

@end

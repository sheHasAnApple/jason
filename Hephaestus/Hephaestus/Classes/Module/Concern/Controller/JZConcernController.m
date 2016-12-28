//
//  JZConcernController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/11/30.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//  Q: for中用masonry

#import "JZConcernController.h"
#import "Masonry.h"
#import "TBCityIconFont.h"
#import "JZSearchController.h"
#import "UIImage+JZ.h"
#import "JZWarningViewCell.h"
#import "JZHeaderViewCell.h"
#import "JZUserViewCell.h"
#import "JZUserViewController.h"


@interface JZConcernController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) UISearchBar *searchBar;

@end

@implementation JZConcernController

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.searchBar resignFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
/****************测试代码***********************/

/*********************************************/
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initSearchBar];
    CGFloat maxY =  CGRectGetMaxY(self.navigationController.navigationBar.frame);
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 47, self.view.frame.size.width, self.view.frame.size.height - 96 - maxY)];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [tableView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:tableView];
}

-(void)initSearchBar
{
    UISearchBar *searchBar = [[UISearchBar alloc]init];
    self.searchBar = searchBar;
    searchBar.delegate = self;
    searchBar.placeholder = @"请输入用户名或编号";
    searchBar.tintColor = [UIColor redColor];//光标颜色
    UIImage *bgImage = [UIImage getImageWithColor:[UIColor whiteColor] andHeight:46];
    [searchBar setBackgroundImage:bgImage];
    
    //利用KVC取出输入框设置属性
    UITextField *searchField = [searchBar valueForKey:@"_searchField"];
    [searchField setValue:[UIColor colorWithRed:172/255.0 green:174/255.0 blue:186/255.0 alpha:1] forKeyPath:@"_placeholderLabel.textColor"];//placeholder颜色
    [searchField setBackgroundColor:[UIColor colorWithRed:243/255.0 green:245/255.0 blue:247/255.0 alpha:1]];//输入框背景颜色
    [searchField setFont:[UIFont systemFontOfSize:12]];
    //设置🔍
    UIImage *image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e6d3", 20, [UIColor colorWithRed:172/255.0 green:174/255.0 blue:186/255.0 alpha:1])];
    UIImageView *iconView = [[UIImageView alloc]initWithImage:image];
    iconView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    searchField.leftView = iconView;
    
    [self.view addSubview:searchBar];
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width, 46));
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
    }];
}

#pragma mark - UISearchBar代理
-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    JZSearchController *vc = [[JZSearchController alloc]init];
    self.hidesBottomBarWhenPushed =  YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

#pragma mark - UITableView代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JZWarningViewCell *wCell = [JZWarningViewCell cellWithTableView:tableView];
    JZHeaderViewCell *hCell1 = [JZHeaderViewCell cellWithHeaderStyle:JZHeaderStyleValue1];
    JZUserViewCell *uCell = [JZUserViewCell cellWithTableView:tableView];
    JZHeaderViewCell *hCell2 = [JZHeaderViewCell cellWithHeaderStyle:JZHeaderStyleValue2];
    
    switch (indexPath.row) {
        case 0:
            return wCell;
        case 1:
            return hCell1;
        case 3:
            return hCell2;
        default:
            return uCell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            return 58;
        case 1:
            return 46;
        case 3:
            return 46;
        default:
            return 75;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JZUserViewController *vc = [[JZUserViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
@end

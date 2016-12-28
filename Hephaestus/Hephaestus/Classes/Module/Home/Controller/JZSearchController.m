//
//  JZSearchController.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/3.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//



#import "JZSearchController.h"
#import "JZTextField.h"
#import "NSString+JZ.h"

@interface JZSearchController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic,weak) JZTextField *searchField;
@property (nonatomic,weak) UITableView *tableView;

@end

@implementation JZSearchController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUpNavHead];
    
    [self setUpTableView];
    
}

-(void)setUpTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView = tableView;
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.bounces = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    UIView *footView = [[UIView alloc]init];
    UIButton *clean = [[UIButton alloc]init];
    [clean setTitle:@"清除历史记录" forState:UIControlStateNormal];
    CGSize textSize = [NSString sizeWithFont:[UIFont systemFontOfSize:13] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) text:@"清除历史记录"];
    clean.titleLabel.font = [UIFont systemFontOfSize:13];
    [clean setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [clean setFrame:CGRectMake((self.view.frame.size.width-textSize.width-10)*0.5, 20, textSize.width+10, textSize.height+10)];
    [clean.layer setCornerRadius:5.0];
    [clean.layer setBorderWidth:0.5];
    clean.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [footView addSubview:clean];
    self.tableView.tableFooterView = footView;
}

-(void)setUpNavHead
{
    [self.navigationItem setHidesBackButton:YES];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    
    JZTextField *searchField = [[JZTextField alloc]initWithFrame:CGRectMake(0, 0, 270, 25)];
    [searchField setBackgroundColor:[UIColor colorWithRed:243/255.0 green:245/255.0 blue:247/255.0 alpha:1.0] isRightBtn:_showCamera isLeftBtn:YES placeholder:@"请输入商品名称"];
    self.searchField = searchField;
    self.searchField.delegate = self;
    self.navigationItem.titleView = searchField;
    [self.searchField becomeFirstResponder];
    [self.searchField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    UIButton *cancel = [[UIButton alloc]init];
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    cancel.titleLabel.font = [UIFont systemFontOfSize:14];
    [cancel sizeToFit];
    [cancel setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [cancel addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:cancel];
}

-(void)textFieldDidChange:(JZTextField *)searchField
{
    NSLog(@"变了");
}

-(void) pop
{
    [self.searchField endEditing:YES];
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 禁用 iOS7 返回手势
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 开启
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

#pragma mark - tableView 代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.text = @"jumpEgg";
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"搜索历史";
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    [titleLable setBackgroundColor:[UIColor colorWithRed:243/255.0 green:245/255.0 blue:247/255.0 alpha:1.0]];
    [titleLable setText:@"    搜索历史"];
    [titleLable setTextColor:[UIColor lightGrayColor]];
    [titleLable setFont:[UIFont systemFontOfSize:14]];
    return titleLable;
}

#pragma mark - textField 代理






@end

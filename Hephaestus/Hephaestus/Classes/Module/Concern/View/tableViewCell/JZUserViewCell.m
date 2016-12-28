//
//  JZUserViewCell.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/19.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZUserViewCell.h"
#import "Masonry.h"
#import "NSString+JZ.h"
#import "TBCityIconFont.h"

#import "JZAccount.h"
#import "JZAccountTool.h"

@interface JZUserViewCell ()

@property (nonatomic,copy) NSString *userName;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,assign) BOOL vip;

@end

@implementation JZUserViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"uCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[JZUserViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self tmp];
        [self initSubViews];
    }
    return self;
}

-(void)tmp
{
    self.userName = @"三胖子";
    self.time = @"09:34:06 2016-12-20";
    self.vip = YES;
}

-(void)initSubViews
{
    UIImageView *iconView = [[UIImageView alloc]init];
    [self addSubview:iconView];
    iconView.image = [UIImage imageNamed:@"头像"];
    iconView.layer.cornerRadius = 24;
    iconView.layer.masksToBounds = YES;
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(48, 48));
        make.left.equalTo(self.mas_left).offset(10);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    CGSize userSize = [NSString sizeWithFont:[UIFont systemFontOfSize:16] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) text:self.userName];
    UILabel *userName = [[UILabel alloc]init];
    [self addSubview:userName];
    [userName setFont:[UIFont systemFontOfSize:15]];
    [userName setText:self.userName];
    if (self.vip) {
        [userName setTextColor:[UIColor redColor]];
    }
    [userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(userSize);
        make.left.equalTo(iconView.mas_right).offset(6);
        make.top.equalTo(self.mas_top).offset(16);
    }];
    
    UIImageView *starView = [[UIImageView alloc]init];
    starView.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e687", 11, [UIColor orangeColor])];
    [self addSubview:starView];
    [starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(11, 11));
        make.left.equalTo(iconView.mas_right).offset(7);
        make.bottom.equalTo(self.mas_bottom).offset(-16);
    }];
    
    NSString *str = @"最后一次更新动态";
    CGSize strSize = [NSString sizeWithFont:[UIFont systemFontOfSize:11] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) text:str];
    UILabel *tipLabel = [[UILabel alloc]init];
    [self addSubview:tipLabel];
    [tipLabel setText:str];
    [tipLabel setTextColor:[UIColor colorWithRed:176/255.0 green:176/255.0 blue:176/255.0 alpha:1.0]];
    [tipLabel setFont:[UIFont systemFontOfSize:9]];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(strSize);
        make.left.equalTo(starView.mas_right).offset(6);
        make.centerY.equalTo(starView.mas_centerY);
    }];
    
    CGSize timeSize = [NSString sizeWithFont:[UIFont systemFontOfSize:11] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) text:self.time];
    UILabel *timeLabel = [[UILabel alloc]init];
    [self addSubview:timeLabel];
    [timeLabel setText:self.time];
    [timeLabel setTextColor:[UIColor colorWithRed:176/255.0 green:176/255.0 blue:176/255.0 alpha:1.0]];
    [timeLabel setFont:[UIFont systemFontOfSize:9]];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(timeSize);
        make.left.equalTo(tipLabel.mas_right).offset(10);
        make.centerY.equalTo(tipLabel.mas_centerY);
    }];
    
    UIImageView *rightView = [[UIImageView alloc]init];
    rightView.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e61f", 14, [UIColor colorWithRed:176/255.0 green:176/255.0 blue:176/255.0 alpha:1.0])];
    [self addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-14);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(14, 14));
    }];
    
    UIView *line = [[UIView alloc]init];
    [line setBackgroundColor:[UIColor colorWithRed:243/255.0 green:245/255.0 blue:247/255.0 alpha:1]];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 1));
        make.left.equalTo(starView.mas_left);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
}


@end

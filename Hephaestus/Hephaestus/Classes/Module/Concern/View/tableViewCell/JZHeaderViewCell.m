//
//  JZHeaderViewCell.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/19.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//  height = 46

#import "JZHeaderViewCell.h"
#import "Masonry.h"
#import "TBCityIconFont.h"
#import "NSString+JZ.h"
#import "JZLabel.h"


@implementation JZHeaderViewCell

+(instancetype)cellWithHeaderStyle:(JZHeaderStyle)style
{
    return [[self alloc]initWithHeaderStyle:style];
}
-(instancetype)initWithHeaderStyle:(JZHeaderStyle)style
{
    if (self = [super init]) {
        self.headerStyle = style;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubViews];
    }
    return self;
}

-(void) initSubViews
{
    UIImage *icon = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e69a", 18, [UIColor redColor])];
    NSString *str = @"推荐用户";
    
    switch (self.headerStyle) {
        case JZHeaderStyleValue1:
            icon = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e69a", 18, [UIColor redColor])];
            str = @"推荐用户";
            break;
        case JZHeaderStyleValue2:
            icon = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e606", 18, [UIColor colorWithRed:123/255.0 green:210/255.0 blue:219/255.0 alpha:1.0])];
            str = @"已关注用户";
            break;
        default:
            break;
    }

    UIView *view = [[UIView alloc]init];
    [view setBackgroundColor:[UIColor colorWithRed:243/255.0 green:245/255.0 blue:247/255.0 alpha:1]];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 10));
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
    }];
    
    UIImageView *iconView = [[UIImageView alloc]init];
    iconView.backgroundColor = [UIColor whiteColor];
    iconView.layer.masksToBounds = YES;
    iconView.layer.cornerRadius = 9;
    [self addSubview:iconView];
    iconView.image = icon;
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(18, 18));
        make.left.equalTo(self.mas_left).offset(10);
        make.centerY.equalTo(self.mas_centerY).offset(5);
    }];
    
    CGSize strSize = [NSString sizeWithFont:[UIFont systemFontOfSize:10] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) text:str];
    strSize.width += 25;
    JZLabel *strLabel = [[JZLabel alloc]init];
    strLabel.edgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
    [strLabel setBackgroundColor:[UIColor colorWithRed:243/255.0 green:245/255.0 blue:247/255.0 alpha:1]];
    [strLabel setText:str];
    [strLabel setFont:[UIFont systemFontOfSize:10]];
    [strLabel setTextColor:[UIColor colorWithRed:97/255 green:97/255 blue:97/255 alpha:1]];
    strLabel.layer.cornerRadius = 9;
    strLabel.clipsToBounds = YES;
    [self addSubview:strLabel];
    [strLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(strSize.width, 18));
        make.left.equalTo(iconView.mas_left);
        make.centerY.equalTo(iconView.mas_centerY);
    }];
    
    [self bringSubviewToFront:iconView];
    
    UIView *line = [[UIView alloc]init];
    [line setBackgroundColor:[UIColor colorWithRed:243/255.0 green:245/255.0 blue:247/255.0 alpha:1]];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 1));
        make.left.equalTo(self.mas_left);
        make.bottom.equalTo(self.mas_bottom);
    }];
}


@end

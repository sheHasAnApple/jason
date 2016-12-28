//
//  JZDefaultCell.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/2.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZDefaultCell.h"
#import "TBCityIconFont.h"
#import "NSString+JZ.h"
#import "Masonry.h"
#import <AVFoundation/AVFoundation.h>

@interface JZDefaultCell ()

@property (nonatomic,strong) UIImageView *rightImage;
@property (nonatomic,assign) CGSize titleSize;
@property (nonatomic,strong) UIView *line;

@end

@implementation JZDefaultCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"dCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpSubViews];
    }
    return self;
}

-(void)setUpSubViews
{
    self.leftImage = [[UIImageView alloc]init];
    self.leftImage.image = [UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e6cb", 20, [UIColor colorWithRed:130/255.0 green:132/255.0 blue:145/255.0 alpha:1.0])];
    [self addSubview:self.leftImage];
    
    self.rightImage = [[UIImageView alloc]initWithImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e61f", 20, [UIColor lightGrayColor])]];
    [self addSubview:self.rightImage];
    
    self.abcLab = [[UILabel alloc]init];
    self.titleSize = [NSString sizeWithFont:[UIFont systemFontOfSize:13] maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT) text:@"测试"];
    [self.abcLab setTextColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0]];
    self.abcLab.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.abcLab];
    
    self.line = [[UIView alloc]init];
    [self.line setBackgroundColor:[UIColor colorWithRed:240/255.0 green:242/255.0 blue:245/255.0 alpha:1.0]];
    [self addSubview:self.line];
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize size = self.frame.size;
    
    [self.leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.mas_left).offset(10);
    }];
    
    [self.abcLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.left.equalTo(self.leftImage.mas_right).offset(10);
        make.size.mas_equalTo(CGSizeMake(100, self.titleSize.height));
    }];
    
    [self.rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(self.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
    self.line.frame = CGRectMake(0, size.height-1, size.width, 1);
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(size.width, 1));
        make.bottom.equalTo(self.mas_bottom);
        make.top.equalTo(self.mas_bottom).offset(-1);
    }];
    
}



@end

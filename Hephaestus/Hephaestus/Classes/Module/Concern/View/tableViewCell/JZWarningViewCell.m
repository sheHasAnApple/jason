//
//  JZWarningViewCell.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/19.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//  height = 58;

#import "JZWarningViewCell.h"
#import "TBCityIconFont.h"
#import "Masonry.h"

@implementation JZWarningViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    id cell = [[JZWarningViewCell alloc]init];
    return cell;
}

-(instancetype)init
{
    if (self = [super init]) {
        [self initSubViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


-(void)initSubViews
{
    UIView *view = [[UIView alloc]init];
    [view setBackgroundColor:[UIColor colorWithRed:243/255.0 green:245/255.0 blue:247/255.0 alpha:1]];
    [self addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(self.frame.size.width, 10));
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
    }];
    
    UILabel *wordLabel = [[UILabel alloc]init];
    wordLabel.numberOfLines = 0;
    [wordLabel setTextColor:[UIColor colorWithRed:166/255.0 green:166/255.0 blue:166/255.0 alpha:1.0]];
    [wordLabel setFont:[UIFont systemFontOfSize:10]];
    [wordLabel setText:@"本站相册均来自第三方平台，我方仅提供图片展示/搜索/分享服务，禁止用于商业交易，如有风险请自负"];
    [self addSubview:wordLabel];
    [wordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(20, 10, 10, 10));
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  JZPictureCell.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/2.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZPictureCell.h"

@interface JZPictureCell ()

@property (nonatomic,strong) UIView *marginView;
@property (nonatomic,strong) UIImageView *bgImage;

@end

@implementation JZPictureCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"pCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.bgImage = [[UIImageView alloc]init];
        self.bgImage.image = [UIImage imageNamed:@"Snip20161202_1"];
        [self addSubview:_bgImage];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.marginView = [[UIView alloc]init];
        [self.marginView setBackgroundColor:[UIColor colorWithRed:240/255.0 green:242/255.0 blue:245/255.0 alpha:1.0]];
        [self addSubview:self.marginView];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize size = self.frame.size;
    
    self.bgImage.frame = CGRectMake(0, 0, size.width, size.height-10);
    
    self.marginView.frame = CGRectMake(0, CGRectGetMaxY(self.bgImage.frame), self.frame.size.width, 10);
    
}

@end

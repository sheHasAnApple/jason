//
//  JZButtonsCell.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/2.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZButtonsCell.h"
#import "JZButton.h"
#import "TBCityIconFont.h"

@interface JZButtonsCell ()
{
    NSArray *_titlesArr;
}
@property (nonatomic,strong) UIView *marginView;
@property (nonatomic,strong) NSMutableArray *arr;
@property (nonatomic,strong) NSMutableArray *lines;


@end

@implementation JZButtonsCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"bCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

-(NSArray *)titlesArr
{
    if (_titlesArr == nil) {
        _titlesArr = [NSMutableArray array];
    }
    return _titlesArr;
}

-(void)setTitlesArr:(NSArray *)titlesArr
{
    _titlesArr = titlesArr;
    [self setUpSubViews];
}

-(void)setUpSubViews
{
    self.arr = [NSMutableArray array];
    self.lines = [NSMutableArray array];
    
    for (int i=0; i<2; i++) {
        UIView *view = [[UIView alloc]init];
        [self addSubview:view];
        [self.lines addObject:view];
        [view setBackgroundColor:[UIColor colorWithRed:240/255.0 green:242/255.0 blue:245/255.0 alpha:1.0]];
    }
    /****
    [self addOneButtonWithImageName:@"\U0000e681" imageColor:[UIColor colorWithRed:248/255.0 green:204/255.0 blue:80/255.0 alpha:1.0] btnTitle:@"发布动态" tag:11];
    [self addOneButtonWithImageName:@"\U0000e6aa" imageColor:[UIColor colorWithRed:107/255.0 green:200/255.0 blue:211/255.0 alpha:1.0] btnTitle:@"我的相册" tag:12];
    [self addOneButtonWithImageName:@"\U0000e603" imageColor:[UIColor colorWithRed:299/255.0 green:93/255.0 blue:103/255.0 alpha:1.0] btnTitle:@"我的关注圈" tag:13];
    ****/
    
    [self addOneButtonWithImageNameAndTitle:self.titlesArr[0] tag:11];
    [self addOneButtonWithImageNameAndTitle:self.titlesArr[1] tag:12];
    [self addOneButtonWithImageNameAndTitle:self.titlesArr[2] tag:13];
    
    self.marginView = [[UIView alloc]init];
    [self addSubview:self.marginView];
    [self.marginView setBackgroundColor:[UIColor colorWithRed:240/255.0 green:242/255.0 blue:245/255.0 alpha:1.0]];

}

-(void)addOneButtonWithImageNameAndTitle:(NSString *)title tag:(NSInteger)tag
{
    JZButton *JZbtn = [[JZButton alloc]init];
    [JZbtn setTitle:title forState:UIControlStateNormal];
    [JZbtn setImage:[UIImage imageNamed:title] forState:UIControlStateNormal];
    [JZbtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    JZbtn.titleLabel.font = [UIFont systemFontOfSize:12.5];
    [JZbtn.titleLabel setTextColor:[UIColor colorWithRed:97/255.0 green:97/255.0 blue:97/255.0 alpha:1.0]];
    JZbtn.layoutStyle = JXLayoutButtonStyleUpImageDownTitle;
    JZbtn.midSpacing = 12;
    [JZbtn addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    JZbtn.tag = tag;
    [self.arr addObject:JZbtn];
    [self addSubview:JZbtn];
}

-(void)didClick:(JZButton *)button
{
    if ([self.delegate respondsToSelector:@selector(JZButtonsCellDidClick:withIndex:)]) {
        [self.delegate JZButtonsCellDidClick:self withIndex:button.tag];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize size = self.frame.size;
    CGFloat btnW = size.width/3;
    CGFloat btnH = size.height-10;
    
    int i = 0;
    for (JZButton *btn in self.arr) {
        CGFloat btnX = i*btnW;
        btn.frame = CGRectMake(btnX, 0, btnW, btnH);
        i++;
    }
    
    i = 1;
    for (UIView *view in self.lines) {
        CGFloat viewX = i*btnW;
        view.frame = CGRectMake(viewX, 0, 1.5, size.height);
        i++;
    }
    
    self.marginView.frame = CGRectMake(0, btnH, size.width, 10);
    
}

@end

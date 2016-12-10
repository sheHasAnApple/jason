//
//  JZTextView.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/4.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZTextView.h"
#import "UIView+JZFrame.h"

@interface JZTextView()

@property (nonatomic,strong)UILabel *placeLabel;

@end

@implementation JZTextView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

-(UILabel *)placeLabel
{
    if (_placeLabel == nil) {
        _placeLabel = [[UILabel alloc]init];
        _placeLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_placeLabel];
    }
    return _placeLabel;
}


-(void)setPlaceholder:(NSString *)placeholder
{
    
    _placeholder = placeholder;
    self.placeLabel.text = placeholder;
    [self.placeLabel sizeToFit];
}

-(void)setFont:(UIFont *)font
{
    [super setFont:font];
    
    self.placeLabel.font = font;
    [self.placeLabel sizeToFit];
}

-(void)setHidePlaceholder:(BOOL)hidePlaceholder
{
    _hidePlaceholder = hidePlaceholder;
    
    self.placeLabel.hidden = hidePlaceholder;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.placeLabel.x = 5;
    self.placeLabel.y = 8;
}


@end

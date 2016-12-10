//
//  JZTextField.m
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/3.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import "JZTextField.h"
#import "TBCityIconFont.h"

@implementation JZTextField

-(void)setBackgroundColor:(UIColor *)bgColor isRightBtn:(BOOL)rBOOL isLeftBtn:(BOOL)lBOOL placeholder:(NSString *)placehodlder
{
    [self setPlaceholder:placehodlder];
    [self setBackgroundColor:bgColor];
    self.layer.cornerRadius = 5.0;
    [self setFont:[UIFont systemFontOfSize:12]];
    
    if (rBOOL) {
        UIButton *photoBtn = [[UIButton alloc]init];
        _rightBtn = photoBtn;
        [photoBtn setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e6aa", 16, [UIColor grayColor])] forState:UIControlStateNormal];
        [photoBtn setFrame:CGRectMake(0, 0, 30, 16)];
        [self setRightView:photoBtn];
        [self setRightViewMode:UITextFieldViewModeAlways];
    }
    
    if (lBOOL) {
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e6d3", 20, [UIColor lightGrayColor])]];
        image.frame = CGRectMake(0, 0, 30, 20);
        [image setContentMode:UIViewContentModeCenter];
        [self setLeftView:image];
        [self setLeftViewMode:UITextFieldViewModeAlways];
    }
    
}


@end

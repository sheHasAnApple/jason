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
    self.tintColor = [UIColor lightGrayColor];
    
    if (rBOOL) {
        UIButton *photoBtn = [[UIButton alloc]init];
        [photoBtn setImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e6aa", 20, [UIColor grayColor])] forState:UIControlStateNormal];
        [photoBtn setFrame:CGRectMake(0, 0, 30, 20)];
        [self setRightView:photoBtn];
        [self setRightViewMode:UITextFieldViewModeAlways];
        [photoBtn addTarget:self action:@selector(takePhoto:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if (lBOOL) {
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage iconWithInfo:TBCityIconInfoMake(@"\U0000e6d3", 20, [UIColor lightGrayColor])]];
        image.frame = CGRectMake(0, 0, 30, 20);
        [image setContentMode:UIViewContentModeCenter];
        [self setLeftView:image];
        [self setLeftViewMode:UITextFieldViewModeAlways];
    }
    
}

-(void)takePhoto:(UIButton *)btn
{
    if ([self.JZDelegate respondsToSelector:@selector(JZTextField:didClickRightButton:)]) {
        [self.JZDelegate JZTextField:self didClickRightButton:btn];
    }
}


@end

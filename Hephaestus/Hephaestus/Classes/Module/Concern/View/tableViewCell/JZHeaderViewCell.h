//
//  JZHeaderViewCell.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/19.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JZHeaderStyle) {
    JZHeaderStyleValue1,
    JZHeaderStyleValue2
} ;

@interface JZHeaderViewCell : UITableViewCell

@property (nonatomic, assign) JZHeaderStyle headerStyle;

+(instancetype)cellWithHeaderStyle:(JZHeaderStyle)style;
-(instancetype)initWithHeaderStyle:(JZHeaderStyle)style;

@end

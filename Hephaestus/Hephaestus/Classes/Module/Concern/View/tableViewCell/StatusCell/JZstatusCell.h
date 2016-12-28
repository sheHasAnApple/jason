//
//  JZstatusCell.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/27.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JZStatusFrame;
@interface JZstatusCell : UITableViewCell
@property (nonatomic, strong) JZStatusFrame *statusF;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end

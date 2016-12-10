//
//  JZDefaultCell.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/2.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZDefaultCell : UITableViewCell

@property (nonatomic,strong) UIImageView *leftImage;
@property (nonatomic,strong) UILabel *abcLab;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

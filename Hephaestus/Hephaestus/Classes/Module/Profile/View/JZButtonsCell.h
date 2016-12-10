//
//  JZButtonsCell.h
//  Hephaestus
//
//  Created by Jianzhong Huang on 2016/12/2.
//  Copyright © 2016年 Jianzhong Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JZButton;
@class JZButtonsCell;
@protocol JZButtonsCellDelegate <NSObject>

-(void) JZButtonsCellDidClick:(JZButtonsCell *)buttonsCell withIndex:(NSInteger)index;

@end

@interface JZButtonsCell : UITableViewCell

@property (nonatomic,weak) JZButton *publish;
@property (nonatomic,weak) JZButton *myAlbum;
@property (nonatomic,weak) JZButton *myConcern;
@property (nonatomic,weak) id<JZButtonsCellDelegate> delegate;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end

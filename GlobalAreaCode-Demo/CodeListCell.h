//
//  CodeListCell.h
//  GlobalAreaCode-Demo
//
//  Created by 许必杨 on 2018/9/12.
//  Copyright © 2018年 xby023. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const KCellIdentifer_CodeListCell = @"CodeListCell";

@interface CodeListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end

//
//  CodeListCell.m
//  GlobalAreaCode-Demo
//
//  Created by 许必杨 on 2018/9/12.
//  Copyright © 2018年 xby023. All rights reserved.
//

#import "CodeListCell.h"

@implementation CodeListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    self.titleLabel.textColor = [UIColor blackColor];
    
    self.subTitleLabel.font = [UIFont systemFontOfSize:14];
    self.subTitleLabel.textColor = [UIColor grayColor];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

//
//  CodeListViewController.h
//  GlobalAreaCode-Demo
//
//  Created by 许必杨 on 2018/9/12.
//  Copyright © 2018年 xby023. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CodeListViewController : UIViewController

@property (nonatomic ,copy) void(^SelectBlock)(NSString *dataStr);

@end

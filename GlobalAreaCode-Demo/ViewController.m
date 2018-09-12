//
//  ViewController.m
//  GlobalAreaCode-Demo
//
//  Created by 许必杨 on 2018/9/12.
//  Copyright © 2018年 xby023. All rights reserved.
//

#import "ViewController.h"
#import "CodeListViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择区域码";
    
    self.selectButton.layer.cornerRadius = 4;
    self.selectButton.layer.masksToBounds = YES;
    
}

- (IBAction)actionForSelect:(UIButton *)sender {
    CodeListViewController *codeListVC = [[CodeListViewController alloc]init];
    codeListVC.SelectBlock = ^(NSString *dataStr) {
        self.showLabel.text = dataStr;
    };
    [self.navigationController pushViewController:codeListVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

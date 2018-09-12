//
//  CodeListViewController.m
//  GlobalAreaCode-Demo
//
//  Created by 许必杨 on 2018/9/12.
//  Copyright © 2018年 xby023. All rights reserved.
//

#import "CodeListViewController.h"
#import "CodeListCell.h"

@interface CodeListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,strong) NSArray *dataArray;

@property (nonatomic ,strong) NSDictionary *dataDic;

@end

@implementation CodeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeDataSource];
    [self initializeUserInterface];
}


- (void)initializeDataSource{
    
    //获取数据
    NSString *path = [[NSBundle mainBundle] pathForResource:@"GlobalAreaCodeList" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    self.dataDic = dic;
    self.dataArray = @[@"热门",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    
}

- (void)initializeUserInterface{
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"区域列表";
    [self.view addSubview:self.tableView];
}

#pragma mark ==================================== tableView ===================================

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CodeListCell *cell = [tableView dequeueReusableCellWithIdentifier:KCellIdentifer_CodeListCell];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *subDataArray = self.dataDic[self.dataArray[indexPath.section]];
    NSDictionary *subDataDic = subDataArray[indexPath.row];
    cell.titleLabel.text = subDataDic[@"country"];
    cell.subTitleLabel.text = [NSString stringWithFormat:@"+%@",subDataDic[@"code"]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *subDataArray = self.dataDic[self.dataArray[section]];
    return subDataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataDic.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.dataArray[section];
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.dataArray;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *subDataArray = self.dataDic[self.dataArray[indexPath.section]];
    NSDictionary *subDataDic = subDataArray[indexPath.row];
    if (self.SelectBlock) {
        self.SelectBlock([NSString stringWithFormat:@"%@ +%@",subDataDic[@"country"],subDataDic[@"code"]]);
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark ====================================getter===================================

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource  = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([CodeListCell class]) bundle:nil] forCellReuseIdentifier:KCellIdentifer_CodeListCell];
    }
    return _tableView;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  ViewController.m
//  tabelViewCell多选
//
//  Created by 刘明 on 16/9/12.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *selectIndexArray;

@property (nonatomic, strong) NSMutableDictionary *mDict;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //假数据
    
    for (int i = 0; i < 30; i++) {
        
        [self.selectIndexArray addObject:@(i)];
        
        [self.mDict setObject:@"0" forKey:[NSString stringWithFormat:@"%zd",i]]; //先给数据都设为0. 0:不被选择 1:选择
    }
    
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    self.tableView.allowsMultipleSelection = YES;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
    
    [self setupNav];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.selectIndexArray.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell" forIndexPath:indexPath];
    
    if(cell == nil){
        
        cell = (TableViewCell *)[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell"];
            
        }
    cell.labelName = [NSString stringWithFormat:@"第%zd个cell",indexPath.row + 1];
    
    //去除存的值
    NSString *result = [_mDict objectForKey:[NSString stringWithFormat:@"%zd",indexPath.row]];
    
    if ([result isEqualToString:@"1"]) {
        
        cell.selectNum = @"1";
        
    }else{
        
        cell.selectNum = @"0";
    }
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *status = [self.mDict objectForKey:[NSString stringWithFormat:@"%zd",indexPath.row]];
    
    if ([status isEqualToString:@"1"]) {
        
        [self.mDict setObject:@"0" forKey:[NSString stringWithFormat:@"%zd",indexPath.row]];
    }else{
        
        [self.mDict setObject:@"1" forKey:[NSString stringWithFormat:@"%zd",indexPath.row]];
    }

    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setupNav{
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"全选" style:UIBarButtonItemStylePlain target:self action:@selector(didClickSelectedAll)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"反选" style:UIBarButtonItemStylePlain target:self action:@selector(didClickSelectedOppose)];
}

- (void)didClickSelectedAll{
    
    
    for (int i = 0; i < self.selectIndexArray.count; i++) {
        
        [self.mDict setObject:@"1" forKey:[NSString stringWithFormat:@"%zd",i]];
        
    }
        [self.tableView reloadData];
    
}

- (void)didClickSelectedOppose{
    
    for (int i = 0; i < self.selectIndexArray.count; i++) {
        
        NSString *status = [self.mDict objectForKey:[NSString stringWithFormat:@"%zd",i]];
        
        if ([status isEqualToString:@"1"]) {
            
            [self.mDict setObject:@"0" forKey:[NSString stringWithFormat:@"%zd",i]];
        }else{
            
            [self.mDict setObject:@"1" forKey:[NSString stringWithFormat:@"%zd",i]];
        }
        
    }

    
    [self.tableView reloadData];

}

- (NSMutableArray *)selectIndexArray{
    
    if (!_selectIndexArray) {
        _selectIndexArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _selectIndexArray;
}

- (NSMutableDictionary *)mDict{
    
    if (!_mDict) {
        _mDict = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return _mDict;
}

@end

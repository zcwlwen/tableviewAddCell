//
//  ViewController.m
//  tableviewAddCell
//
//  Created by 张朝伟 on 16/7/27.
//  Copyright © 2016年 amailive. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong)UITableView *testTable;
@property (nonatomic,strong)NSMutableArray *dataArray1;

@end

@implementation ViewController{
    int index;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    index = 3;
     _dataArray1=[[NSMutableArray alloc]initWithObjects:@"1",@"2", nil];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setUI];
     NSLog(@"%lu",(unsigned long)_dataArray1.count);
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setUI{
    _testTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 400) style:UITableViewStylePlain];
    _testTable.backgroundColor = [UIColor clearColor];
    _testTable.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _testTable.contentOffset = CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX); 
    [self.view addSubview:_testTable];
    _testTable.delegate = self;
    _testTable.dataSource = self;
    
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    addBtn.frame = CGRectMake(200, 200, 40, 20);
    [addBtn setTitle:@"添加" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    addBtn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:addBtn];
}

- (void)add{
    
    [_dataArray1 addObject:[NSString stringWithFormat:@"%d",index++]];
    
    //滑动时不进行调用
    if(!_testTable.isDragging) {
        [_testTable setContentOffset:CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    }
    //手触摸、移动或者滚动时，不调用
    if(!(_testTable.isTracking || _testTable.isDragging || _testTable.isDecelerating)) {
        [_testTable setContentOffset:CGPointMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    }
    
    [_testTable reloadData];
   
    
}

#pragma mark TableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray1.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
   
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
     cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = _dataArray1[indexPath.row];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

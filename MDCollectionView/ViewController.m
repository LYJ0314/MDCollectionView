//
//  ViewController.m
//  MDCollectionView
//
//  Created by LYJ on 16/11/25.
//  Copyright © 2016年 com.LYJ. All rights reserved.
//

#define SW [[UIScreen mainScreen]bounds].size.width
#define SH [[UIScreen mainScreen]bounds].size.height
#define ButtonWidth (SW-80)/3

#import "ViewController.h"
#import "MDCollectionView.h"
@interface ViewController ()

@property (nonatomic, strong) MDCollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (NSMutableArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [NSMutableArray new];
        for (int i = 1; i <= 20; i++) {
            [_dataSource addObject:[NSString stringWithFormat:@"%d.jpg",i]];
        }
    }
    return _dataSource;
}
- (MDCollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = [[MDCollectionView alloc]initWithFrame:CGRectMake(0, 100, SW, SH-100) DataSource:self.dataSource];
    }
    return _collectionView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.collectionView];
    
    UIButton *deleteBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, ButtonWidth, 60)];
    [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [deleteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:deleteBtn];
    
    UIButton *moveBtn = [[UIButton alloc]initWithFrame:CGRectMake(ButtonWidth+40, 20, ButtonWidth, 60)];
    [moveBtn setTitle:@"移动" forState:UIControlStateNormal];
    [moveBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [moveBtn addTarget:self action:@selector(editingAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:moveBtn];
    
    UIButton *insertBtn = [[UIButton alloc]initWithFrame:CGRectMake(ButtonWidth*2+60, 20, ButtonWidth, 60)];
    [insertBtn setTitle:@"插入" forState:UIControlStateNormal];
    [insertBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [insertBtn addTarget:self action:@selector(addingAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:insertBtn];


}
- (void)deleteAction:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"删除"]) {
        self.collectionView.type = MDDelete;
        [sender setTitle:@"取消" forState:UIControlStateNormal];
    }else if ([sender.titleLabel.text isEqualToString:@"取消"]){
        self.collectionView.type = MDCancelDelete;
        [sender setTitle:@"删除" forState:UIControlStateNormal];
    }
    
}

- (void)editingAction:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"移动"]) {
        self.collectionView.type = MDMove;
        [sender setTitle:@"取消" forState:UIControlStateNormal];
        
    }else if ([sender.titleLabel.text isEqualToString:@"取消"]){
        self.collectionView.type = MDCancelMove;
        [sender setTitle:@"移动" forState:UIControlStateNormal];
    }
}

- (void)addingAction:(UIButton *)sender{
    if ([sender.titleLabel.text isEqualToString:@"插入"]) {
        self.collectionView.type = MDInsert;
        [sender setTitle:@"取消" forState:UIControlStateNormal];
        
    }else if ([sender.titleLabel.text isEqualToString:@"取消"]){
        self.collectionView.type = MDCancelInsert;
        [sender setTitle:@"插入" forState:UIControlStateNormal];
    }
}


@end

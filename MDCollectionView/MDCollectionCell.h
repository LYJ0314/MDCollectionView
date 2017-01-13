//
//  MDCollectionCell.h
//  MDCollectionView
//
//  Created by LYJ on 16/11/25.
//  Copyright © 2016年 com.LYJ. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MDCellDeleteDelegate

- (void)deleteCellAction:(CGPoint)point;

@end


@interface MDCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UIButton *deleteBtn;

@property (nonatomic, weak) id <MDCellDeleteDelegate> deleteDelegate;


@end

//
//  MDCollectionView.h
//  MDCollectionView
//
//  Created by LYJ on 16/11/25.
//  Copyright © 2016年 com.LYJ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    MDDelete = 1,
    MDCancelDelete,
    MDMove,
    MDCancelMove,
    MDInsert,
    MDCancelInsert,
} MDMethodType;

@interface MDCollectionView : UIView

@property (nonatomic, assign) MDMethodType type;

- (id)initWithFrame:(CGRect)frame
         DataSource:(NSArray *)dataSource;

@end

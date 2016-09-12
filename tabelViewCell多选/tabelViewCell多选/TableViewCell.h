//
//  TableViewCell.h
//  tabelViewCell多选
//
//  Created by 刘明 on 16/9/12.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, copy) NSString *labelName;

@property (nonatomic, copy) NSString *selectNum;


@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

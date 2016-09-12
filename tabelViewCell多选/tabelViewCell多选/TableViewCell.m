//
//  TableViewCell.m
//  tabelViewCell多选
//
//  Created by 刘明 on 16/9/12.
//  Copyright © 2016年 刘明. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()


@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setLabelName:(NSString *)labelName{
    
    _labelName = labelName;
    
    self.label.text = labelName;
    
}

- (void)setSelectNum:(NSString *)selectNum{
    
    
    _selectNum = selectNum;
    
    if ([selectNum isEqualToString:@"1"]) {
        
        self.iconView.hidden = NO;
    }else{
        
        self.iconView.hidden = YES;
        
    }

}



@end

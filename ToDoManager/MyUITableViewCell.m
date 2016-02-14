//
//  MyUITableViewCell.m
//  ToDoManager
//
//  Created by Vincent Cordaro on 2/13/16.
//  Copyright © 2016 Vincent Cordaro. All rights reserved.
//

#import "MyUITableViewCell.h"

@implementation MyUITableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setInternalFields:(ToDoEntity *)incomingToDoEntity{
    
    
    
    self.toDoTitleLabel.text = incomingToDoEntity.toDoTitle;
    NSString *sign = @"$";
    NSString *num = [NSString stringWithFormat: @"%@", incomingToDoEntity.toDoAmount];
    self.toDoAmountLabel.text = [sign stringByAppendingString:num];
    self.localToDoEntity = incomingToDoEntity;
}

@end

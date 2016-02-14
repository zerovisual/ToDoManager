//
//  VCHandlesToDoEntity.h
//  ToDoManager
//
//  Created by Vincent Cordaro on 2/13/16.
//  Copyright © 2016 Vincent Cordaro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ToDoEntity.h"

@protocol VCHandlesToDoEntity <NSObject>

- (void) recieveToDoEntity:(ToDoEntity *)incomingToDoEntity;

@end

//
//  MyUIViewController.h
//  ToDoManager
//
//  Created by Vincent Cordaro on 2/13/16.
//  Copyright © 2016 Vincent Cordaro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCHandlesMOC.h"
#import "VCHandlesToDoEntity.h"


@interface MyUIViewController : UIViewController <VCHandlesMOC, VCHandlesToDoEntity>

- (void) recieveMOC:(NSManagedObjectContext *)incomingMOC;
- (void) recieveToDoEntity:(ToDoEntity *)incomingToDoEntity;


@end

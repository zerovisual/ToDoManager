//
//  MyUITableViewController.h
//  ToDoManager
//
//  Created by Vincent Cordaro on 2/13/16.
//  Copyright © 2016 Vincent Cordaro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCHandlesMOC.h"

@interface MyUITableViewController : UITableViewController <VCHandlesMOC>

- (void) recieveMOC:(NSManagedObjectContext *)incomingMOC;

@end

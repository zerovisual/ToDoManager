//
//  VCHandlesMOC.h
//  ToDoManager
//
//  Created by Vincent Cordaro on 2/13/16.
//  Copyright © 2016 Vincent Cordaro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VCHandlesMOC <NSObject>

- (void) recieveMOC:(NSManagedObjectContext *)incomingMOC;

@end

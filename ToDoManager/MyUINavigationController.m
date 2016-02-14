//
//  MyUINavigationController.m
//  ToDoManager
//
//  Created by Vincent Cordaro on 2/13/16.
//  Copyright © 2016 Vincent Cordaro. All rights reserved.
//

#import "MyUINavigationController.h"

@interface MyUINavigationController ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation MyUINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) recieveMOC:(NSManagedObjectContext *)incomingMOC{
    
    self.managedObjectContext = incomingMOC;
    id<VCHandlesMOC> child = (id<VCHandlesMOC>) self.viewControllers[0];
    [child recieveMOC:self.managedObjectContext];
}

@end

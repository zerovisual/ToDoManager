//
//  MyUIViewController.m
//  ToDoManager
//
//  Created by Vincent Cordaro on 2/13/16.
//  Copyright © 2016 Vincent Cordaro. All rights reserved.
//

#import "MyUIViewController.h"

@interface MyUIViewController ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) ToDoEntity *localToDoEntity;
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *payeeField;
@property (weak, nonatomic) IBOutlet UITextField *amountField;

@property(nonatomic, assign) BOOL wasDeleted;
@end

@implementation MyUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}


- (void) recieveMOC:(NSManagedObjectContext *)incomingMOC{
    
    self.managedObjectContext = incomingMOC;
    
}

- (void) recieveToDoEntity:(ToDoEntity *)incomingToDoEntity{
    self.localToDoEntity = incomingToDoEntity;
}

- (void) viewWillAppear:(BOOL)animated{
    //Setup Form
    self.wasDeleted = false;
    self.titleField.text = self.localToDoEntity.toDoTitle;
    self.payeeField.text = self.localToDoEntity.toDoPayee;
    self.amountField.text = [NSString stringWithFormat: @"%@", self.localToDoEntity.toDoAmount];
    
}

- (void) saveMyToDoEntity{
    NSError *err;
    BOOL saveSuccess = [self.managedObjectContext save:&err];
    
    if(!saveSuccess){
        @throw [NSException exceptionWithName:NSGenericException reason:@"Couldn't save" userInfo:@{NSUnderlyingErrorKey:err}];
        
    }
}
- (IBAction)trashTapped:(id)sender {
    self.wasDeleted = true;
    [self.managedObjectContext deleteObject:self.localToDoEntity];
    [self saveMyToDoEntity];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (IBAction)titleFieldEditted:(id)sender {
    self.localToDoEntity.toDoTitle = self.titleField.text;
    [self saveMyToDoEntity];
}

- (IBAction)payeeFieldEditted:(id)sender {
    self.localToDoEntity.toDoPayee = self.payeeField.text;
    [self saveMyToDoEntity];
}
- (IBAction)amountFieldEditted:(id)sender {
   
    self.localToDoEntity.toDoAmount =[NSNumber numberWithInt:[self.amountField.text intValue]];
    
    [self saveMyToDoEntity];
    
    
}

-(void) viewWillDisappear:(BOOL)animated{
    if(!self.wasDeleted){
        self.localToDoEntity.toDoTitle = self.titleField.text;
        self.localToDoEntity.toDoPayee = self.payeeField.text;
        self.localToDoEntity.toDoAmount =[NSNumber numberWithInt:[self.amountField.text intValue]];
        
        [self saveMyToDoEntity];
    }
    [[NSNotificationCenter defaultCenter] removeObserver: self name:UITextViewTextDidBeginEditingNotification object:self];
    
}




@end

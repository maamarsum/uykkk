//
//  ViewSelectCountryNLanguage.m
//  Gizmeondeals
//
//  Created by Maneesh M on 20/04/15.
//  Copyright (c) 2015 Maneesh M. All rights reserved.
//

#import "ViewSelectCountryNLanguage.h"

@implementation ViewSelectCountryNLanguage
@synthesize tableViewMain,arrayTableContents;

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        // initilize all your UIView components
        
        
        tableViewMain.dataSource=self;
        tableViewMain.delegate=self;
        arrayTableContents = [NSArray new];
        
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] ;
        
        
        self.bounds = self.view.bounds;
        
        [self addSubview:self.view];
       
        
        
        
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        if (self.subviews.count == 0) {
            
            UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
            UIView *subview = [[nib instantiateWithOwner:self options:nil] objectAtIndex:0];
            subview.frame = self.bounds;
            [self addSubview:subview];
        
//        NSString *className = NSStringFromClass([self class]);
//         [[NSBundle mainBundle] loadNibNamed:className owner:self options:nil] ;
//        [self addSubview:self.view];
        
    }
    }
    return self;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (arrayTableContents) {
        
        return arrayTableContents.count;
    }else{
        
        return 0;
    }
    
}
-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *cellId =@"popUpViewCustomeCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        
    }
    
    
    cell.textLabel.text = (NSString*)[arrayTableContents objectAtIndex:indexPath.row];
    
    // country name
    cell.textLabel.text = [[arrayTableContents objectAtIndex:indexPath.row] valueForKey:@"name"];
    
    
    return cell;
}
-(void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    
    
}
-(void) reloadTable
{
    
    [tableViewMain reloadData];
    
}

@end
